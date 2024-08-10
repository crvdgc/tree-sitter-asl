=====
ASLSemanticsReference.t/SemanticsRule.EUnknownIntegerRange3-42-42.asl
=====
func main () => integer
begin

  let x = UNKNOWN:integer {3, 42};
  assert x==42;

  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (constraint
              (constraint_range
                (expr_atom
                  (int_lit)))
              (constraint_range
                (expr_atom
                  (int_lit)))))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
