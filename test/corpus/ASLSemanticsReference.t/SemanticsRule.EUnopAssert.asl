=====
ASLSemanticsReference.t/SemanticsRule.EUnopAssert.asl
=====
func main () => integer
begin

  let x = NOT '1010';
  assert x=='0101';

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
          (unop)
          (expr_atom
            (bitvector_lit))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (bitvector_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
