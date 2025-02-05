use std::io::Write;

use tree_sitter_asl_highlight as highlight;

fn main() {
    let input = std::io::read_to_string(std::io::stdin()).unwrap();
    let highlighted = highlight::highlight_adapter(&input);
    std::io::stdout().write_all(highlighted.as_bytes()).unwrap();
}
