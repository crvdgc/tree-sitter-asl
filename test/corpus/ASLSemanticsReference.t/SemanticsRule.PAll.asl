=====
ASLSemanticsReference.t/SemanticsRule.PAll.asl
=====
func main () => integer
begin

  let match_me = 42 IN { - };
  assert match_me == TRUE;

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
            (pattern))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (boolean_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
