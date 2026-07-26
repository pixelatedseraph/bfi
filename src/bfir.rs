pub enum Bfir{
    Add(usize),
    Sub(usize),
    LeftShift(usize),
    RightShift(usize),
    WriteChar(),
    ReadChar(),
    BeginLoop,
    EndLoop,
}

impl Bfir {
    pub fn dump_bfir(source : &str) -> Vec<Bfir>{
        
        let mut bfir_stream: Vec<Bfir> = Vec::new();
        let mut iter = source.chars().peekable();

        while let Some(ch) = iter.next(){
            match ch{
                '+' | '-' | '>' | '<' =>{
                    let mut count = 1;
                    while let Some(&next) = iter.peek(){
                        if next == ch{
                            count+=1;
                            iter.next();
                        }
                        else {
                            break;
                        }
                    }
                    bfir_stream.push(
                        match ch {
                            '+' => Bfir::Add(count),
                            '-' => Bfir::Sub(count),
                            '>' => Bfir::RightShift(count),
                            '<' => Bfir::LeftShift(count),
                            _ => unreachable!(),
                        }
                    );
                }
                '.' => {
                   bfir_stream.push(Bfir::WriteChar());
                }
                ','  => {
                    bfir_stream.push(Bfir::ReadChar());
                }
                '[' => {
                    bfir_stream.push(Bfir::BeginLoop);
                }
                ']' => {
                    bfir_stream.push(Bfir::EndLoop);
                }
                _ => {}
            }
        }
        bfir_stream
    }
}