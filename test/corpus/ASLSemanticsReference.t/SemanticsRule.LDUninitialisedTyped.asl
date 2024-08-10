=====
ASLSemanticsReference.t/SemanticsRule.LDUninitialisedTyped.asl
=====
func main () => integer
begin
  var x: integer {3..42};

  assert x == 3;

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
                  (int_lit))
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
