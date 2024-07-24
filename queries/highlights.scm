(identifier) @variable

((identifier) @function.method
 (#is-not? local))

(function_decl) @function

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
