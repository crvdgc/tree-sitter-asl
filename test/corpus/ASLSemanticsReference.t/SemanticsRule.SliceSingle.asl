=====
ASLSemanticsReference.t/SemanticsRule.SliceSingle.asl
=====
func main () => integer
begin
  let x = '00000100';

  assert x[2] == '1';

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
            (bitvector_lit))))
      (stmt
        (expr_atom
          (expr_atom
            (identifier))
          (slice
            (expr_atom
              (int_lit))))
        (binop_comparison)
        (expr_atom
          (bitvector_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
