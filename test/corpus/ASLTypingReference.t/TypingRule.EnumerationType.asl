=====
ASLTypingReference.t/TypingRule.EnumerationType.asl
=====
type Color of enumeration { RED, BLACK } ;

func main () => integer
begin
  assert (RED != BLACK);
  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (identifier)
      (identifier)))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (pattern
            (expr_atom
              (identifier))
            (binop_comparison)
            (expr_atom
              (identifier)))))
      (stmt
        (expr_atom
          (int_lit))))))
