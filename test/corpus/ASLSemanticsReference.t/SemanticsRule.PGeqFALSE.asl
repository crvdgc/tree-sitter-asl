=====
ASLSemanticsReference.t/SemanticsRule.PGeqFALSE.asl
=====
func main () => integer
begin

  let match_me = 3 IN { >= 42 };
  assert match_me == FALSE;

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
          (expr_atom
            (int_lit))
          (binop_in)
          (pattern_set
            (pattern
              (expr_atom
                (int_lit))))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (boolean_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
