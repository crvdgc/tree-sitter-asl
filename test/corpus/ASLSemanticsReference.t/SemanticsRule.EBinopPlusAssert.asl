=====
ASLSemanticsReference.t/SemanticsRule.EBinopPlusAssert.asl
=====
func main () => integer
begin

  let x = 3 + 2;
  assert x==5;

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
          (binop_add_sub_logic)
          (expr_atom
            (int_lit))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
