#![allow(warnings)]


use std::ops::Index;
use std::{env, fs};
use std::fs::File;
use std::io::prelude::*;
use std::os::unix::process;
use colored::Colorize;
use std::collections::HashMap;

struct bracket_parser{
    stack      : Vec<char>,
    is_matched : bool,
    map        : HashMap<char,Vec<usize>>,
}

impl bracket_parser{
    fn new() -> Self{
        Self { stack: (Vec::new()), is_matched: (false), map: (HashMap::new())}
    }
    fn parse(&mut self,source: &str) -> &bracket_parser{
        for (idx,ch) in source.char_indices(){
            if ch == '['{
                self.map.entry(ch).or_default().push(idx);
                self.stack.push(ch);
            }
            else if ch == ']'{
                self.map.entry(ch).or_default().push(idx);
                if !self.stack.is_empty(){
                    self.stack.pop();
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

            let mut lbrace_count = 0;
            let mut  rbrace_count = 0;

            if let Some(lbrace_count_vec) = self.map.get(&'['){
                lbrace_count = lbrace_count_vec.len();
            }

            if let Some(rbrace_count_vec) = self.map.get(&']'){
                rbrace_count = rbrace_count_vec.len();
            }
            
            eprintln!("[{}]: Found {} '[' but only {} got closed","Hint".purple(),lbrace_count,rbrace_count);
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
            println!("[{}]",ch);
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
                        eprintln!("{}: {}","Side Effect Error".red(),err);
                        std::process::exit(1);
                    });
                self.instructions_idx+=1;
            }
            else if cmd == '['{
                if self.tape[self.tape_idx] == 0 {
                } 
            } 
        }
    }
}



fn main(){
    let mut bp = bracket_parser::new();
    bp.parse("[[ ] ] [[] [[ ]]][ ][ ] [ ] ][[ []]]").verify();
    println!("{:?}",bp.map);
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