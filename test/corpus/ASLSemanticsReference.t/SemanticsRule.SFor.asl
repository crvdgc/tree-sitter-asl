=====
ASLSemanticsReference.t/SemanticsRule.SFor.asl
=====
func main () => integer
begin

  for i = 0 to 3 do
    assert i <= 3;
    print(i);
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
        (identifier)
        (expr_atom
          (int_lit))
        (direction)
        (expr_atom
          (int_lit))
        (stmt
          (expr_atom
            (identifier))
          (binop_comparison)
          (expr_atom
            (int_lit)))
        (stmt
          (identifier)
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (int_lit))))))
