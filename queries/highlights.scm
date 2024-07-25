(identifier) @variable

; Type identifiers

(type_decl (identifier) @type)
(expr_atom (identifier) @type "{")

[
 "boolean"
 "integer"
 "real"
 "string"
 "bit"
 "bits"
 "enumeration"
 "array"
 "exception"
] @type.builtin

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
  "throw"
] @keyword

(ty) @type

; Literals

[
 "UNKNOWN"
] @constant

[
  (string_lit)
  (bitvector_lit)
  (bitmask_lit)
] @string

[
  (int_lit)
  (hex_lit)
  (real_lit)
] @number

[
  (boolean_lit)
] @constant

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
