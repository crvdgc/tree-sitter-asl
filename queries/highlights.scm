(identifier) @variable

(type_decl (identifier) @type)
(expr_atom (identifier) @type "{")

(function_decl
  (identifier) @function)

[
  "func"
  "begin"
  "end"
  "if"
  "then"
  "elsif"
  "else"
  "return"
  "let"
  "var"
  "constant"
  "assert"
  "type"
  "of"
] @keyword

(ty) @type

; Literals

[
  (string_lit)
] @string

[
  (int_lit)
] @number

[
  (boolean_lit)
] @constant.builtin

(comment) @comment

; Operators

[
"="
"=>"
"&&"
"||"
"-->"
"<->"
"=="
"!="
">"
">="
"<"
"<="
] @operator

[
  ","
  ";"
  "."
  ":"
  "*:"
  "+:"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.bracket
