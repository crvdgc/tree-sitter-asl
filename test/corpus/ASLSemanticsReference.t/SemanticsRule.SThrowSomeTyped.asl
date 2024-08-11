=====
ASLSemanticsReference.t/SemanticsRule.SThrowSomeTyped.asl
=====
type MyExceptionType of exception{ a: integer };

func main () => integer
begin

  try
    throw MyExceptionType { a = 42 };
  catch
    when exn: MyExceptionType =>
      assert exn.a == 42;
    otherwise => assert FALSE;
  end

  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (field
        (identifier)
        (ty))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (stmt
          (expr_atom
            (identifier)
            (field_assignment
              (identifier)
              (expr_atom
                (int_lit)))))
        (catcher
          (identifier)
          (ty
            (identifier))
          (stmt
            (expr_atom
              (expr_atom
                (identifier))
              (identifier))
            (binop_comparison)
            (expr_atom
              (int_lit))))
        (stmt
          (expr_atom
            (boolean_lit))))
      (stmt
        (expr_atom
          (int_lit))))))
