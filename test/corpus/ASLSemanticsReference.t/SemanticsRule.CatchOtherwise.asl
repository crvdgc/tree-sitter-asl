=====
ASLSemanticsReference.t/SemanticsRule.CatchOtherwise.asl
=====
type MyExceptionType1 of exception{};
type MyExceptionType2 of exception{};

func main () => integer
begin

     try
       throw MyExceptionType1 {};
       assert FALSE;
     catch
       when MyExceptionType2 =>
         assert FALSE;
       otherwise =>
         assert TRUE;
     end

  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty))
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
            (identifier)))
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
