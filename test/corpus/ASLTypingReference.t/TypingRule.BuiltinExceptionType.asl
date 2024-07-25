=====
ASLTypingReference.t/TypingRule.BuiltinExceptionType.asl
=====
type Not_found of exception;
type SyntaxException of exception { message:string };

func main () => integer
begin
  if UNKNOWN : boolean then
    throw Not_found {};
  else
    throw SyntaxException { message="syntax" };
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
    (ty
      (field
        (identifier)
        (ty))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (ty)
        (stmt
          (expr_atom
            (identifier)))
        (stmt
          (expr_atom
            (identifier)
            (field_assignment
              (identifier)
              (expr_atom
                (string_lit))))))
      (stmt
        (expr_atom
          (int_lit))))))
