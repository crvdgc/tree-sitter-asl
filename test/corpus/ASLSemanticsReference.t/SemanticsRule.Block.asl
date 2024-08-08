=====
ASLSemanticsReference.t/SemanticsRule.Block.asl
=====
func main() => integer
begin
  var x : integer = 1;

  if TRUE then x = 2; let y = 2;  else pass; end
  let y = 1;
  assert (x == 2 && y == 1);

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
        (expr_atom
          (boolean_lit))
        (stmt
          (lexpr_atom
            (identifier))
          (expr_atom
            (int_lit)))
        (stmt
          (decl_stmt
            (identifier)
            (expr_atom
              (int_lit))))
        (stmt))
      (stmt
        (decl_stmt
          (identifier)
          (expr_atom
            (int_lit))))
      (stmt
        (expr_atom
          (pattern
            (expr_atom
              (identifier))
            (binop_comparison)
            (expr_atom
              (int_lit))
            (binop_boolean)
            (expr_atom
              (identifier))
            (binop_comparison)
            (expr_atom
              (int_lit)))))
      (stmt
        (expr_atom
          (int_lit))))))
