=====
ASLSemanticsReference.t/SemanticsRule.LDTuple.asl
=====
func main () => integer
begin

  var (x, y, z) = (1, 2, 3);

  assert x == 1 && y == 2 && z == 3;

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
          (identifier)
          (identifier)
          (expr_atom
            (pattern
              (expr_atom
                (int_lit)))
            (pattern
              (expr_atom
                (int_lit)))
            (pattern
              (expr_atom
                (int_lit))))))
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
