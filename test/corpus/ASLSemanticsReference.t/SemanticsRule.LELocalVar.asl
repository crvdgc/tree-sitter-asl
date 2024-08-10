=====
ASLSemanticsReference.t/SemanticsRule.LELocalVar.asl
=====
func main () => integer
begin

  var x: integer = 3;
  x = 42;
  assert x == 42;

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
          (ty)
          (expr_atom
            (int_lit))))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
