=====
ASLSemanticsReference.t/SemanticsRule.LEDestructuring.asl
=====
func main () => integer
begin

  var x: integer = 42;
  var y: integer = 3;

  (x, y) = (3, 42);

  assert x == 3 && y == 42;

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
        (decl_stmt
          (identifier)
          (ty)
          (expr_atom
            (int_lit))))
      (stmt
        (lexpr_atom
          (identifier))
        (lexpr_atom
          (identifier))
        (expr_atom
          (pattern
            (expr_atom
              (int_lit)))
          (pattern
            (expr_atom
              (int_lit)))))
      (stmt
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
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
