=====
ASLSemanticsReference.t/SemanticsRule.PTupleFALSE.asl
=====
func main () => integer
begin

  let match_me = (3, '101010') IN {( >= 42, 'xx1010')};
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
            (pattern
              (expr_atom
                (int_lit)))
            (pattern
              (expr_atom
                (bitvector_lit))))
          (binop_in)
          (pattern_set
            (pattern
              (expr_atom
                (pattern
                  (expr_atom
                    (int_lit)))
                (pattern
                  (pattern_set
                    (bitmask_lit))))))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (boolean_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
