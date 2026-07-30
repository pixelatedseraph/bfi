#![allow(warnings)]

mod bfir;

use std::io::ErrorKind::Other;
use std::ops::Index;
use std::{env, fs};
use std::fs::File;
use std::io::prelude::*;
use std::os::unix::process;
use colored::Colorize;
use std::collections::HashMap;
use std::path::Path;
use std::process::Command;

use crate::bfir::Bfir;

/* Book Keeping */
struct stack_element{
    character : char,
    index     : usize, 
}

impl stack_element{
    fn new(character : char, index : usize) -> Self{
        Self { character: (character), index: (index) }
    }
}

/* Book Keeping  */
struct bracket_parser{
    stack      : Vec<stack_element>,
    is_matched : bool,
    map        : HashMap<usize,usize>, 
    brace_count: (usize,usize),
}

/* We need the following behavior to implement looping  */

/* Map(OpeningBraceIndex) = ClosingBraceIndex 
   Map(ClosingBraceIndex) = OpeningBraceIndex
*/

impl bracket_parser{
    fn new() -> Self{
        Self { stack: (Vec::new()), is_matched: (false), map: (HashMap::new()), brace_count: (0,0)}
    }
    fn parse(&mut self,source: &str) -> &bracket_parser{
        for (idx,ch) in source.char_indices(){
            if ch == '['{
                self.brace_count.0+=1;
                let se = stack_element::new(ch, idx);
                self.stack.push(se);
            }
            else if ch == ']'{
                self.brace_count.1+=1;
                if !self.stack.is_empty(){
                    if let Some(se) = self.stack.pop(){
                       self.map.insert(idx,se.index);
                       self.map.insert(se.index, idx);
                    }
                }
                else{  /* Errorneous Case */
                    return self;
                }
            }
        }
        if self.stack.is_empty(){
            self.is_matched = true;
            return self;
        }
        return self;
    }

    fn verify(&self) {
        if self.is_matched == false{
            eprintln!("[{}]: {}","Syntax Error".red(),"Unmatched Brace");

            let lbrace_count = self.brace_count.0;
            let rbrace_count = self.brace_count.1;

            if(lbrace_count > rbrace_count){
                eprintln!("[{}]: Found {} '[' but only {} ']' got closed","Hint".purple(),lbrace_count,rbrace_count);
            }           
            else{
                eprintln!("[{}]: Found {} '[' but got closed by {} ']'","Hint".purple(),lbrace_count,rbrace_count);
            }
            std::process::exit(1);
        }
    }

}

/* Execution Context For Interpreter*/
struct BrainFuck{
    tape             : Vec<u8>,
    tape_idx         : usize,
    instructions     : String,
    instructions_idx : usize,
    source_file_name : String,
}


impl BrainFuck{
    fn new() -> Self{
        Self { tape: (vec![0;30_000]), tape_idx: (0), instructions: (String::new()), instructions_idx: (0), source_file_name: (String::new()) }
    }

    fn copy_instructions(&mut self,path: &str) -> Result<(),std::io::Error>{
        let file_name = Path::new(path)
            .file_name()
            .unwrap()
            .to_str()
            .unwrap();
        self.instructions = fs::read_to_string(path)?;
        self.source_file_name = String::from(file_name);
        Ok(())
    }

    fn print_instructions(&self){
        println!("{}",self.instructions);
    } 

    fn print_tape(&self){
        for i in 0..self.tape_idx{
            print!("[{}]",self.tape[i]);
        }
        println!();

        /* for ch in self.tape.iter(){
            print!("[{}]",ch);
        } */
    }

    fn read_next_instruction(&mut self){
        let mut bp = bracket_parser::new();
        bp.parse(&self.instructions).verify();

        while self.instructions_idx < self.instructions.len(){
            let cmd = self.instructions.as_bytes()[self.instructions_idx] as char;
            match cmd{
                '+' => 
                {
                    if(self.tape[self.tape_idx] == u8::MAX){
                        self.tape[self.tape_idx] = 0;
                    }
                    else{
                        self.tape[self.tape_idx] += 1;
                    }
                    self.instructions_idx+=1;
                }

                '-' => 
                {
                    if(self.tape[self.tape_idx] == u8::MIN){
                        self.tape[self.tape_idx] = 255;
                    }
                    else{
                        self.tape[self.tape_idx] -= 1;
                    }
                    self.instructions_idx+=1;
                }

                '>' => 
                {
                    self.tape_idx +=1;
                    self.instructions_idx+=1;
                }
                '<' =>
                {
                    if self.tape_idx == 0{
                        eprintln!("[{}]: {} in {} at column {} ","Semantic Error".red(),"No further left shifting allowed",self.source_file_name.bright_yellow(),self.instructions_idx);
                        eprintln!("[{}]: {}","Hint".purple(),"Try Using right shifting operator(>)");
                        std::process::exit(1);
                    }
                    self.tape_idx -=1;
                    self.instructions_idx+=1
                }
                '.' =>
                {
                    let tape_char = self.tape[self.tape_idx];

                    print!("{}",tape_char as char);
                    self.instructions_idx+=1;
                }
                ',' => 
                {

                    let mut user_input = [0u8; 1];
                    std::io::stdin().read_exact(&mut user_input).unwrap_or_else(
                    |err|{

                        eprintln!("[{}]: in {} {}","Side Effect Error".red(),self.source_file_name,err);
                        std::process::exit(1);
                    });
                    let ch = user_input[0];
                    self.tape[self.tape_idx] = ch;

                    self.instructions_idx+=1;
                }
                '[' =>
                {
                      if self.tape[self.tape_idx] == 0 {
                        let jump_index = bp.map.get(&self.instructions_idx).unwrap_or_else(||{
                            eprintln!("[{}]","Internal Book Keeping Error".red());
                            eprintln!("[{}]: {}","Hint".purple(),"Couldnt find corresponding index for braces in the HashMap");
                            std::process::exit(1);
                        });
                    //let jump_index= bp.map.get(&self.instructions_idx).unwrap();

                        self.instructions_idx = *jump_index;
                    } 
                    else if self.tape[self.tape_idx] != 0{
                        self.instructions_idx+=1;
                    }
                }

                ']' => 
                {
                    if self.tape[self.tape_idx] != 0{
                        let jump_index = bp.map.get(&self.instructions_idx).unwrap_or_else(||{
                            eprintln!("[{}]","Internal Book Keeping Error".red());
                            eprintln!("[{}]: {}","Hint".purple(),"Couldnt find corresponding index for braces in the HashMap");
                            std::process::exit(1);
                        });
                    //let jump_index= bp.map.get(&self.instructions_idx).unwrap();
                        self.instructions_idx  = *jump_index;
                    }
                    else if self.tape[self.tape_idx] == 0{
                        self.instructions_idx+=1;
                    }
                }
                _ => {self.instructions_idx+=1;}
            }
        }
    }

}


/* Execution context for the Compiler */
/* Execution Context for the complier */
struct CWriter{
    source_code : String,
    instructions: String,
    file_name   : String,
    bfir_representation : Vec<Bfir>
}

impl CWriter{
    fn new() -> Self{
        Self { source_code: (String::new()), instructions: (String::new()), file_name: (String::new()), bfir_representation: (Vec::new())}
    }

    fn generate_auto_file_header(&mut self) {
        self.source_code.push_str(
            "/*\n\
            *  This file was automatically generated by bfi's compiler.\n\
            *\n\
            *  DO NOT EDIT THIS FILE DIRECTLY.\n\
            *  Any changes will be overwritten the next time this file is generated.\n\
            *\n\
            *  Copyright (c) 2026 Mazeed.\n\
            */\n\n",
        );
    }

    fn generate_headers(&mut self){
        self.source_code.push_str("#include<stdio.h>\n");
        self.source_code.push_str("\n");
    }

    fn generate_execution_context(&mut self){
        self.source_code.push_str("static unsigned char tape[30000] = {0};\n");
    }

    fn generate_main(&mut self) {
        self.source_code.push_str("int main(){\n");
        self.source_code.push_str("\n");
        /* Generated code Goes here */
    } 

    fn terminate_main(&mut self){
        self.source_code.push_str("return 0; \n}");
    }


    fn copy_instructions(&mut self,path: &str) -> Result<(),std::io::Error>{
        let file_name = Path::new(path)
            .file_name()
            .unwrap()
            .to_str()
            .unwrap();
        self.instructions = fs::read_to_string(path)?;
        self.file_name = String::from(file_name);

        self.bfir_representation = Bfir::dump_bfir(&self.instructions);

        Ok(())
    }

    fn generate_pointer(&mut self){
        self.source_code.push_str("char* restrict p = tape;\n");
    }

    fn read_bfir_instructions(&mut self){
        self.generate_auto_file_header();
        self.generate_headers();
        self.generate_execution_context();
        self.generate_main();
        self.generate_pointer();

        for instruction in self.bfir_representation.iter(){
            match instruction {
                Bfir::Add(val) => self.source_code.push_str(format!("(*p)+={};\n", val).as_str()),
                Bfir::Sub(val) => self.source_code.push_str(format!("(*p)-={};\n", val).as_str()),
                Bfir::LeftShift(val) => self.source_code.push_str(format!("p-= {};\n", val).as_str()),
                Bfir::RightShift(val) => self.source_code.push_str(format!("p+= {};\n", val).as_str()),
                Bfir::WriteChar() => self.source_code.push_str("putchar(*p);\n"),
                Bfir::ReadChar() => self.source_code.push_str("*p = getchar();\n"),
                Bfir::BeginLoop => self.source_code.push_str("while(*p) {\n"),
                Bfir::EndLoop => self.source_code.push_str("}\n"),
            }
        }
        self.terminate_main();
    }


    fn read_next_instruction(&mut self){
        self.generate_auto_file_header();
        self.generate_headers();
        self.generate_execution_context();
        self.generate_main();
        self.generate_pointer();
        
        for ch in self.instructions.chars(){
            if ch == '+'{
                self.source_code.push_str("++(*p);\n");
            }
            else if ch == '-'{
                self.source_code.push_str("--(*p);\n");
            }
            else if ch == '>'{
                self.source_code.push_str("++p;\n");
            }
            else if ch == '<'{
                self.source_code.push_str("--p;\n");
            }
            else if ch == '.'{
                self.source_code.push_str("putchar(*p);\n");
            }
            else if ch == ','{
                self.source_code.push_str("*p = getchar();\n");
            }
            else if ch == '['{
                self.source_code.push_str("while(*p){ \n");
            }
            else if ch == ']'{
                self.source_code.push_str("}\n");
            }
        }
        self.terminate_main();
    }

}


fn main() -> Result<(),std::io::Error>{
    let cl_args: Vec<_> = env::args().collect();

    if cl_args.len() == 1{
        eprintln!("[{}]: {}: {}","bfi".bright_yellow(),"Fatal Error".bright_red(),"No brainf*ck source file passed");
        eprintln!("{}","compilation terminated.");
        std::process::exit(1);
    }

    if cl_args.len() == 3 {
        if !cl_args[2].ends_with(".bf"){
            eprintln!("[{}]: {}: {}","bfi".bright_yellow(),"Fatal Error".red(),"file format not recognized!");   
            eprintln!("{}: {}","Hint".purple(),"Try passing a file with the file extension `.bf` "); 
            std::process::exit(1);
        }
        if &cl_args[1] == "run"{ /* invoke interpreter */
            let mut brainfuck = BrainFuck::new();

            brainfuck.copy_instructions(&cl_args[2]).unwrap_or_else(|err|{
                eprintln!("{}: {}","bfi".yellow(),format!("{}",err).red());
                std::process::exit(1);
            });
            brainfuck.read_next_instruction();

            return Ok(());
        }
        else if &cl_args[1] == "compile"{ 
            let mut cwriter = CWriter::new();

            cwriter.copy_instructions(&cl_args[2]).unwrap_or_else(|err|{
                eprintln!("{}: {}","bfi".yellow(),format!("{}",err).red());
                std::process::exit(1);
            });

            cwriter.read_bfir_instructions();

            let mut cdumpfile_name = cwriter.file_name.strip_suffix(".bf").unwrap().to_string();
            cdumpfile_name.push_str(".c");
            let cdumpexec_name = cwriter.file_name.strip_suffix(".bf").unwrap();

            fs::write(&cdumpfile_name, &cwriter.source_code).unwrap();
            let status = Command::new("cc")
                .args([
                    "-Ofast",
                    "-march=native",
                    "-flto",
                    "-std=c11",
                    &cdumpfile_name,
                    "-o",
                    cdumpexec_name
                ]).status()?;

            let _ = fs::remove_file(cdumpfile_name);
            println!("{}","compiled successfully!".green());
            return Ok(());

        }
        else if &cl_args[1] == "hcompile"{
            let output = Command::new("/home/mazeed/Projects/HaskCodeGen/dist-newstyle/build/x86_64-linux/ghc-9.6.7/HaskCodeGen-0.1.0.0/x/HaskCodeGen/build/HaskCodeGen/HaskCodeGen")
                .args([
                    &cl_args[2]
                ]).status()?;

            if let Some(x) = output.code(){
                match x{
                    1 => {
                        eprintln!("{}: {}: {}","bfi".yellow(),"Error:".red(),"No such file");
                        eprintln!("{}","compilation terminated.".red());
                        std::process::exit(1);
                    }
                    2 => {
                        eprintln!("[{}]: {}: {}","bfi".bright_yellow(),"Fatal Error".red(),"file format not recognized!");   
                        eprintln!("{}: {}","Hint".purple(),"Try passing a file with the file extension `.bf` "); 
                        eprintln!("{}","compilation terminated.".red());
                        std::process::exit(1);
                    }
                    _ => {}
                }
            }
            let path = Path::new(&cl_args[2]);
            let new_path = path.with_extension("c");
            let new_exec_path = path.with_extension("");

            let status = Command::new("cc")
                .args([
                    "-Ofast",
                    "-march=native",
                    "-flto",
                    "-std=c11",
                    &new_path.to_str().unwrap(),
                    "-o",
                    &new_exec_path.to_str().unwrap(),
                ]).status()?;

            println!("{}","compiled successfully!".green());
            return Ok(());

        }
        else if &cl_args[1] == "dump"{
            let mut cwriter = CWriter::new();

            cwriter.copy_instructions(&cl_args[2]).unwrap_or_else(|err|{
                eprintln!("{}: {}","bfi".yellow(),format!("{}",err).red());
                std::process::exit(1);
            });

            cwriter.read_bfir_instructions();

            let mut cdumpfile_name = cwriter.file_name.strip_suffix(".bf").unwrap().to_string();
            cdumpfile_name.push_str(".c");

            fs::write(cdumpfile_name, &cwriter.source_code).unwrap();

            return Ok(());
        }
        else {
            eprintln!("{}: {}: {}","bfi".bright_yellow(),"Fatal Error".red(),"Invalid argument passed");
            eprintln!("{}: {}","Hint".purple(),"Usage : bfi <operation> <file>");
            eprintln!("{}: ","operation: run,compile,dump");

            std::process::exit(1);
        }

    }

    if cl_args.len() != 3{
        eprintln!("{}: {}: {}","bfi".bright_yellow(),"Fatal Error".red(),"Invalid argument passed");
        eprintln!("{}: {}","Hint".purple(),"Usage : bfi <operation> <file>");
        eprintln!("{}: ","operation: run,compile,dump");
        std::process::exit(1);
    }

    if cl_args.len() > 3{
        eprintln!("[{}]: {}","Fatal Error".red(),"Multiple brainf*ck source files arent supported");
        std::process::exit(1);
    }
    Ok(())
}
