=====
ASLSemanticsReference.t/SemanticsRule.EBinopAndFalse.asl
=====
func fail() => boolean
begin
  assert FALSE;
  return TRUE;
end

func main () => integer
begin
  let b = FALSE && fail();
  assert b == FALSE;
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
          (boolean_lit)))
      (stmt
        (expr_atom
          (boolean_lit)))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (expr_atom
            (boolean_lit))
          (binop_boolean)
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (boolean_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
