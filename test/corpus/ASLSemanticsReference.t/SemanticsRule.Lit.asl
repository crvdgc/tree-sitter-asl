=====
ASLSemanticsReference.t/SemanticsRule.Lit.asl
=====
func main () => integer
begin

  assert 3 == 3;
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
          (int_lit))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
