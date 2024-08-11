=====
ASLSemanticsReference.t/SemanticsRule.PMaskTRUE.asl
=====
func main () => integer
begin

  let match_me = '101010' IN 'xx1010';
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
            (bitvector_lit))
          (binop_in)
          (pattern_set
            (bitmask_lit))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (boolean_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
