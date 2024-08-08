=====
ASLSemanticsReference.t/SemanticsRule.EPatternFALSE.asl
=====
func main () => integer
begin

  let x = 42 IN {0..3, -4};
  assert x == FALSE;

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
                (int_lit))
              (expr_atom
                (int_lit)))
            (pattern
              (unop)
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
