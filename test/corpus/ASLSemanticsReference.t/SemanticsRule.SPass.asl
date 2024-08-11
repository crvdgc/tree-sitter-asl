=====
ASLSemanticsReference.t/SemanticsRule.SPass.asl
=====
func main () => integer
begin

  pass;

  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt)
      (stmt
        (expr_atom
          (int_lit))))))
