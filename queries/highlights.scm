(identifier) @variable

; Type identifiers
(type_decl (identifier) @type)
(expr_atom (identifier) @type "{")

; Constants
(type_decl (ty "enumeration" (identifier) @constant))
(ty "enumeration" (identifier) @constant)
(field (identifier) @constant)
(field_assignment (identifier) @constant)

; Function

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
