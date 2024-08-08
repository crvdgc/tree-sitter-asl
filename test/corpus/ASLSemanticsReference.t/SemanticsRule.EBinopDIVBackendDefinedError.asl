=====
ASLSemanticsReference.t/SemanticsRule.EBinopDIVBackendDefinedError.asl
=====
func main () => integer
begin

  let x = 3 DIV 0;

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
          (binop_mul_div_shift)
          (expr_atom
            (int_lit))))
      (stmt
        (expr_atom
          (int_lit))))))
