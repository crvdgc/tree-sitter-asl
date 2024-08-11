=====
ASLSemanticsReference.t/SemanticsRule.SRepeat.asl
=====
func main () => integer
begin

  var i: integer = 0;
  repeat
    assert i <= 3;
    print(i);
    i = i + 1;
  until i > 3;

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
        (stmt
          (expr_atom
            (identifier))
          (binop_comparison)
          (expr_atom
            (int_lit)))
        (stmt
          (identifier)
          (expr_atom
            (identifier)))
        (stmt
          (lexpr_atom
            (identifier))
          (expr_atom
            (identifier))
          (binop_add_sub_logic)
          (expr_atom
            (int_lit)))
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
