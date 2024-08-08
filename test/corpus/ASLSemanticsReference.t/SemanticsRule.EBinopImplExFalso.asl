=====
ASLSemanticsReference.t/SemanticsRule.EBinopImplExFalso.asl
=====
func main () => integer
begin
  let b = (0 == 1) --> (1 == 0);
  assert b;
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
            (pattern
              (expr_atom
                (int_lit))
              (binop_comparison)
              (expr_atom
                (int_lit))))
          (binop_boolean)
          (expr_atom
            (pattern
              (expr_atom
                (int_lit))
              (binop_comparison)
              (expr_atom
                (int_lit))))))
      (stmt
        (expr_atom
          (identifier)))
      (stmt
        (expr_atom
          (int_lit))))))
