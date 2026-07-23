use std::io;

pub enum Commands{
    Plus,
    Minus,
    Left,
    Right,
    Dot,
    Comma,
    OpenBracket,
    CloseBracket,
}

#[derive(Debug)]
pub struct BrainFuck{
    memory_tape: [u8; 30000],
    current_ptr: usize,
}

impl BrainFuck{
    pub fn new() -> Self{
        Self { memory_tape: [0;30000], current_ptr: (0) }
    }

    pub fn get_next_command(&mut self,source_code: &str){
        let internal = source_code.to_string();

        for cmd in internal.bytes(){
            if cmd == b'+'{
                self.memory_tape[self.current_ptr] +=1;
            }
            else if cmd == b'-'{
                self.memory_tape[self.current_ptr] -=1;
            }
            else if cmd == b'>'{
                self.current_ptr+=1; 
            }
            else if cmd == b'<'{
                self.current_ptr-=1;
            }
            else if cmd == b'.'{
                println!("[{}] ",self.memory_tape[self.current_ptr]);
            }
            else if cmd == b',' {
                let mut input = String::new();
                io::stdin()
                    .read_line(&mut input)
                    .unwrap();
            }
        }
    }

    pub fn print_tape(&self){
        for i in 0..=self.current_ptr{
            print!("[{}] ",self.memory_tape[i]);
        }
        println!();
    }

}


