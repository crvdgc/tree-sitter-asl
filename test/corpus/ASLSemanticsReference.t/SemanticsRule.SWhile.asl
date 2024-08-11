=====
ASLSemanticsReference.t/SemanticsRule.SWhile.asl
=====
func main () => integer
begin

var i: integer = 0;
  while i <= 3 do
    assert i <= 3;
    i = i + 1;
   end

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
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit))
        (stmt
          (expr_atom
            (identifier))
          (binop_comparison)
          (expr_atom
            (int_lit)))
        (stmt
          (lexpr_atom
            (identifier))
          (expr_atom
            (identifier))
          (binop_add_sub_logic)
          (expr_atom
            (int_lit))))
      (stmt
        (expr_atom
          (int_lit))))))
