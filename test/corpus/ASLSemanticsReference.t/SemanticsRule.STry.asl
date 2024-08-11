=====
ASLSemanticsReference.t/SemanticsRule.STry.asl
=====
type MyExceptionType of exception{ a: integer };

func main () => integer
begin

  try
    throw MyExceptionType { a = 42 };

  catch
    when MyExceptionType => assert TRUE;
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
          (ty
            (identifier))
          (stmt
            (expr_atom
              (boolean_lit))))
        (stmt
          (expr_atom
            (boolean_lit))))
      (stmt
        (expr_atom
          (int_lit))))))
