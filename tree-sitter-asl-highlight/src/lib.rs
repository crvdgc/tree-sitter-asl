// https://andrewtbiehl.com/blog/jekyll-tree-sitter
use tree_sitter_cli::highlight::Theme;
use tree_sitter_highlight::{Highlight, HighlightConfiguration, Highlighter, HtmlRenderer};
// use tree_sitter_loader::{Config, Loader};

// Adapter function for interoperating with Tree-sitter's highlight library.
//
// * `code` - The code snippet to highlight.
// * `scope` - The TextMate scope identifying the language of the code snippet.
pub fn highlight_adapter(code: &str) -> String {
    // The directory to search for parsers
    // let parser_directory = std::env::current_dir().unwrap().join("parsers");

    let theme = Theme::default();

    // The loader is used to load parsers
    // let loader = {
    //     let mut loader = Loader::new().unwrap();
    //     let config = {
    //         let parser_directories = vec![parser_directory];
    //         Config { parser_directories }
    //     };
    //     loader.find_all_languages(&config).unwrap();
    //     loader.configure_highlights(&theme.highlight_names);
    //     loader
    // };

    // Retrieve the highlight config for the given language scope
    // let config = loader
    //     .language_configuration_for_scope(scope)
    //     .unwrap()
    //     .and_then(|(language, config)| config.highlight_config(language).ok())
    //     .unwrap()
    //     .unwrap();

    let code = code.as_bytes();

    // Highlight the code
    let mut highlighter = Highlighter::new();
    let asl_language = tree_sitter_asl::language();
    let mut config = HighlightConfiguration::new(
        asl_language,
        "asl",
        tree_sitter_asl::HIGHLIGHTS_QUERY,
        "",
        tree_sitter_asl::LOCALS_QUERY,
    )
    .unwrap();
    config.configure(&theme.highlight_names);
    let highlights = highlighter
        .highlight(&config, code, None, |_| None)
        .unwrap();

    // Render and return the highlighted code as an HTML snippet
    let get_style_css = |h: Highlight| theme.styles[h.0].css.as_ref().unwrap().as_bytes();
    let mut renderer = HtmlRenderer::new();
    renderer.render(highlights, code, &get_style_css).unwrap();
    renderer.lines().collect()
}
