(identifier) @variable
(parameter (identifier) @variable.parameter)
(formal (identifier) @variable.parameter)
((identifier) @function.method
 (#is-not? local))
("-" @variable)


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
 "record"
 "exception"
] @type.builtin

; Constants

(type_decl (ty "enumeration" (identifier) @constant))
(ty "enumeration" (identifier) @constant)
(field (identifier) @constant)
(field_assignment (identifier) @constant)
(bitfield (identifier) @constant)

; Function

(function_decl (identifier) @function)

[
  ; func def
  "func"
  "begin"
  "end"

  ; if then else
  "if"
  "then"
  "elsif"
  "else"

  ; declaration
  "let"
  "var"
  "constant"
  "config"
  "type"
  "of"
  "as"

  ; statements
  "return"
  "assert"
  "while"
  "do"
  "pass"
  "throw"
  "try"
  "catch"
  "when"
  "otherwise"
  "for"
  "to"
  "downto"
  "case"
] @keyword

; (ty) @type

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
 (binop_boolean)
 (binop_comparison)
 (binop_add_sub_logic)
 (binop_mul_div_shift)
 (binop_pow)
 (binop_in)
 (unop)
 "="
 "=>"
 "<="
 ">="
 "<"
 ">"
 ".."
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
