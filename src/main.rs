#![allow(warnings)]

//TODO: FATAL BOOK KEEPING BUG at line 188 (Highest Priority)

use std::ops::Index;
use std::{env, fs};
use std::fs::File;
use std::io::prelude::*;
use std::os::unix::process;
use colored::Colorize;
use std::collections::HashMap;


struct stack_element{
    character : char,
    index     : usize, 
}

impl stack_element{
    fn new(character : char, index : usize) -> Self{
        Self { character: (character), index: (index) }
    }
}


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

struct BrainFuck{
    tape             : Vec<u8>,
    tape_idx         : usize,
    instructions     : String,
    instructions_idx : usize,
}


impl BrainFuck{
    fn new() -> Self{
        Self { tape: (vec![0;30_000]), tape_idx: (0), instructions: (String::new()), instructions_idx: (0) }
    }

    fn copy_instructions(&mut self,path: &str) -> Result<(),std::io::Error>{
        self.instructions = fs::read_to_string(path)?;
        Ok(())
    }

    fn print_instructions(&self){
        println!("{}",self.instructions);
    } 

    fn print_tape(&self){
        for ch in self.tape.iter(){
            print!("[{}]",ch);
        }
    }

    fn read_next_instruction(&mut self){
        let mut bp = bracket_parser::new();
        bp.parse(&self.instructions).verify();


        for cmd in self.instructions.chars(){
            if cmd == '+'{
                if(self.tape[self.tape_idx] == u8::MAX){
                    self.tape[self.tape_idx] = 0;
                }
                self.tape[self.tape_idx] += 1;
                self.instructions_idx+=1;
            }
            else if cmd == '-'{
                if(self.tape[self.tape_idx] == u8::MIN){
                    self.tape[self.tape_idx] = 255;
                }
                self.tape[self.tape_idx] -= 1;
                self.instructions_idx+=1;
            }
            else if cmd == '>'{
                self.tape_idx +=1;
                self.instructions_idx+=1;
            }
            else if cmd == '<'{
                if self.tape_idx == 0{
                    eprintln!("{}: {}","Semantic Error".red(),"No further left shifting allowed");
                    eprintln!("{}: {}","Hint".purple(),"Try Using right shifting operator(>)");
                    std::process::exit(1);
                }
                self.tape_idx -=1;
                self.instructions_idx+=1;
            }
            else if cmd == '.'{
                print!("{}",self.tape[self.tape_idx]);
                self.instructions_idx+=1;
            }
            else if cmd == ','{
                let mut user_input = String::new();
                std::io::stdin().read_line(&mut user_input).unwrap_or_else(
                    |err|{
                        eprintln!("[{}]: {}","Side Effect Error".red(),err);
                        std::process::exit(1);
                    });
                user_input.push('\n');
                self.instructions_idx+=1;
            }
            else if cmd == '['{
                if self.tape[self.tape_idx] == 0 {
                    /* let jump_index = bp.map.get(&self.instructions_idx).unwrap_or_else(||{
                        eprintln!("[{}]","Internal Book Keeping Error".red());
                        eprintln!("[{}]: {}","Hint".purple(),"Couldnt find corresponding index for braces in the HashMap");
                        std::process::exit(1);
                    }); */
                    println!("{:?}",bp.map);
                    let jump_index= bp.map.get(&self.instructions_idx).unwrap();

                    self.instructions_idx = *jump_index;
                } 
                else if self.tape[self.tape_idx] != 0{
                    self.instructions_idx+=1;
                }
            }
            else if cmd == ']'{
                if self.tape[self.tape_idx] != 0{
                    /* let jump_index = bp.map.get(&self.instructions_idx).unwrap_or_else(||{
                        eprintln!("[{}]","Internal Book Keeping Error".red());
                        eprintln!("[{}]: {}","Hint".purple(),"Couldnt find corresponding index for braces in the HashMap");
                        std::process::exit(1);
                    }); */
                    println!("{:?}",bp.map);
                    let jump_index= bp.map.get(&self.instructions_idx).unwrap();
                    self.instructions_idx  = *jump_index;
                }
                else if self.tape[self.tape_idx] == 0{
                    self.instructions_idx+=1;
                }
            } 
        }
    }
}


fn main() -> Result<(),std::io::Error>{
    let mut brainfuck = BrainFuck::new();
    /* let cl_args: Vec<_> = env::args().collect();

    if cl_args.len() != 2{
        eprintln!("[{}]: {}","Fatal Error".red(),"No source file passed");   
        std::process::exit(1);
    }

    if cl_args[1].contains(".bf") == false{
        eprintln!("[{}]: {}","Fatal Error".red(),"The file provided isnt a valid extension for brainf*ck program");   
        std::process::exit(1);
    }*/

    brainfuck.copy_instructions("test.bf")?;
    brainfuck.read_next_instruction();

    brainfuck.print_tape();
    

    /* let mut bp = bracket_parser::new();
    bp.parse("[][]").verify();
    
    println!("{:?}",bp.map); */



    Ok(())
}
/*
#[cfg(test)]
mod tests{
    use crate::parse_brackets;

    
    #[test]
    fn test_pb1(){
        assert_eq!(parse_brackets("[]["),false);
    }
    #[test]
    fn test_pb2(){
        assert_eq!(parse_brackets("]"),false);
    }

    #[test]
    fn test_pb3(){
        assert_eq!(parse_brackets("[[]"),false);
    }

    #[test]
    fn test_pb4(){
        assert_eq!(parse_brackets("[[[[[[[[[]]]]]]]]]"),true);
    }


    #[test]
    fn test_pb5(){
        assert_eq!(parse_brackets("[][[]][[][]]"),true);
    }


    #[test]
    fn test_pb6(){
        assert_eq!(parse_brackets("[][][][][][][]"),true);
    }


    #[test]
    fn test_pb7(){
        assert_eq!(parse_brackets("[[[]]]"),true);
    }


    #[test]
    fn test_pb8(){
        assert_eq!(parse_brackets("[[][[]][]]"),true);
    }


    #[test]
    fn test_pb9(){
        assert_eq!(parse_brackets("[[[[["),false);
    }

    #[test]
    fn test_pb10(){
        assert_eq!(parse_brackets("]]]]]]]"),false);
    }

    #[test]
    fn test_pb11(){
        assert_eq!(parse_brackets("[[]]][[]"),false);
    }

    #[test]
    fn stress_test(){
        let mut test = String::new();
        test.push_str(&"[".repeat(100_000));
        test.push_str(&"]".repeat(99_999));
        assert_eq!(parse_brackets(&test),false)
    }


    
}


*/