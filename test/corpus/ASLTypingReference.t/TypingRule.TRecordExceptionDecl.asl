=====
ASLTypingReference.t/TypingRule.TRecordExceptionDecl.asl
=====
type MyRecord of record { a: integer, b: boolean };
type MyException of exception { a: integer, b: boolean };

func main () => integer
begin return 0; end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (field
        (identifier)
        (ty))
      (field
        (identifier)
        (ty))))
  (type_decl
    (identifier)
    (ty
      (field
        (identifier)
        (ty))
      (field
        (identifier)
        (ty))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (int_lit))))))
