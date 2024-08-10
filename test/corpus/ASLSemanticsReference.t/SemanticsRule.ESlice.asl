=====
ASLSemanticsReference.t/SemanticsRule.ESlice.asl
=====
func main () => integer
begin

  let x = ['11110000'[6:3]];
  assert x == '1110';

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
            (expr_atom
              (expr_atom
                (bitvector_lit))
              (slice
                (expr_atom
                  (int_lit))
                (expr_atom
                  (int_lit)))))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (bitvector_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
