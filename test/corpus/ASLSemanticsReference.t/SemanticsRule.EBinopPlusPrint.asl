=====
ASLSemanticsReference.t/SemanticsRule.EBinopPlusPrint.asl
=====
func main () => integer
begin

  let x = 3 + 2;
  print(x);

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
        (identifier)
        (expr_atom
          (identifier)))
      (stmt
        (expr_atom
          (int_lit))))))
