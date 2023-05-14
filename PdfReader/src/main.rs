use std::fs;
use std::path::{Path, PathBuf};
use std::env;

fn main() -> Result<(), Box<dyn std::error::Error>> {

    let args: Vec<String> = env::args().collect();

    if args.len() <= 1 {
        println!("Usage: ./pdfreader <file_path> [params...]");
        return Ok(());
    }

    let file_path = &args[1];
    let file_name = Path::new(file_path)
        .file_name()
        .unwrap()
        .to_string_lossy();

    match file_name {
        std::borrow::Cow::Borrowed("! Refresh") => {
            return refresh();
        }
        _ => {
            println!("Unknown file: {}", file_path);
        }
    }

    Ok(())
}

fn refresh() -> Result<(), Box<dyn std::error::Error>> {
    
    // Find all PDF files matching the pattern
    let pattern = "/mnt/SDCARD/Roms/*/Manuals/*.pdf";
    let pdf_files = glob::glob(pattern)?.filter_map(Result::ok);

    // Create a bash script for each PDF file found
    for pdf_file in pdf_files {
        let mut script_path = PathBuf::from("/mnt/SDCARD/Roms/Read");
        script_path.push(pdf_file.file_stem().unwrap());
        script_path.set_extension("sh");

        let mut script_contents = String::new();
        script_contents.push_str("#!/bin/bash\n");
        script_contents.push_str("/mnt/SDCARD/Roms/Read/.utils/fbpdf ");
        script_contents.push_str(&pdf_file.to_string_lossy());

        fs::write(script_path, script_contents)?;
    }

    println!("Refreshed");

    Ok(())
}
