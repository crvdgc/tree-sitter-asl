=====
ASLSemanticsReference.t/SemanticsRule.EConcat.asl
=====
func main () => integer
begin

  let x = [['10','11']];
  assert x=='1011';

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
              (expr_atom
                (bitvector_lit))))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (bitvector_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
