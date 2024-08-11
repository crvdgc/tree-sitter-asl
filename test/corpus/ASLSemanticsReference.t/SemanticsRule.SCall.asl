=====
ASLSemanticsReference.t/SemanticsRule.SCall.asl
=====
func main () => integer
begin

  assert Zeros(3) == '000';

  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (identifier)
          (expr_atom
            (int_lit)))
        (binop_comparison)
        (expr_atom
          (bitvector_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
