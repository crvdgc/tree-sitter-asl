=====
ASLSemanticsReference.t/SemanticsRule.SReturnNone.asl
=====
func print_me ()
begin

  for i = 0 to 42 do
    if i >= 3 then
      return;
    end
  end
  assert FALSE;

end

func main () => integer
begin

    print_me ();

    return 0;
end
---

(source_file
  (function_decl
    (identifier)
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
            (int_lit))
          (stmt)))
      (stmt
        (expr_atom
          (boolean_lit)))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (identifier))
      (stmt
        (expr_atom
          (int_lit))))))
