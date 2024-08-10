=====
ASLSemanticsReference.t/SemanticsRule.FCall.asl
=====
func foo (x : integer) => integer
begin

  return x + 1;

end

func bar (x : integer)
begin

  assert x == 3;

end

func main () => integer
begin

  assert foo(2) == 3;
  bar(3);

  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty))
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (identifier))
        (binop_add_sub_logic)
        (expr_atom
          (int_lit)))))
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty))
    (subprogram_body
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (identifier)
          (expr_atom
            (int_lit)))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (identifier)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
