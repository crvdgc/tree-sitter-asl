=====
ASLSemanticsReference.t/SemanticsRule.LESlice.asl
=====
func main () => integer
begin

  var x = '11111111';
  x[3:0] = '0000';
  assert x == '11110000';

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
        (lexpr_atom
          (lexpr_atom
            (identifier))
          (slice
            (expr_atom
              (int_lit))
            (expr_atom
              (int_lit))))
        (expr_atom
          (bitvector_lit)))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (bitvector_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
