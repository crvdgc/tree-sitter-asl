=====
ASLSemanticsReference.t/SemanticsRule.FUndefIdent.asl
=====
func main () => integer
begin

     foo ();

  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (identifier))
      (stmt
        (expr_atom
          (int_lit))))))
