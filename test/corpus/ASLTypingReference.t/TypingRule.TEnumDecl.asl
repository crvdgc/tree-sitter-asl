=====
ASLTypingReference.t/TypingRule.TEnumDecl.asl
=====
type MyEnum of enumeration { A, B, C };

func main () => integer
begin return 0; end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (identifier)
      (identifier)
      (identifier)))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (int_lit))))))
