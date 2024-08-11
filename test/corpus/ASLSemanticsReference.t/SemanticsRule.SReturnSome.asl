=====
ASLSemanticsReference.t/SemanticsRule.SReturnSome.asl
=====
func f () => (integer, integer)
begin
  var x: integer = 0;
  for i = 0 to 5 do
    x = x + 1;
    assert x == 1; // Only the first loop is executed
    return (3, 42);
  end
end

func main () => integer
begin

  let (x, y) = f ();
  assert x == 3 && y == 42;

  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (ty
      (ty)
      (ty))
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (ty)
          (expr_atom
            (int_lit))))
      (stmt
        (identifier)
        (expr_atom
          (int_lit))
        (direction)
        (expr_atom
          (int_lit))
        (stmt
          (lexpr_atom
            (identifier))
          (expr_atom
            (identifier))
          (binop_add_sub_logic)
          (expr_atom
            (int_lit)))
        (stmt
          (expr_atom
            (identifier))
          (binop_comparison)
          (expr_atom
            (int_lit)))
        (comment)
        (stmt
          (expr_atom
            (pattern
              (expr_atom
                (int_lit)))
            (pattern
              (expr_atom
                (int_lit))))))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (identifier)
          (expr_atom
            (identifier))))
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
