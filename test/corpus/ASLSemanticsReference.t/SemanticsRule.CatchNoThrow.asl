=====
ASLSemanticsReference.t/SemanticsRule.CatchNoThrow.asl
=====
type MyExceptionType of exception{};

func main () => integer
begin

    try
      assert TRUE;
    catch
      when MyExceptionType =>
        assert FALSE;
      otherwise =>
        assert FALSE;
    end

  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (stmt
          (expr_atom
            (boolean_lit)))
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
