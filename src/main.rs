use std::process;
use std::io::{self,Write};
use std::path::Path;

fn main() {
    for p in Path::new(".").canonicalize().unwrap().as_path().ancestors() {
        for s in [".svn", ".git"].iter() {
            let d = p.join(s);
            if d.exists() && d.is_dir() {
                println!("{}", d.display());
                io::stdout().flush().unwrap();
                process::exit(0);
            }
        }
    }
    process::exit(1);
}
