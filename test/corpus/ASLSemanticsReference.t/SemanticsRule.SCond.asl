=====
ASLSemanticsReference.t/SemanticsRule.SCond.asl
=====
func main () => integer
begin

  if TRUE
    then assert TRUE;
    else assert FALSE;
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
        (expr_atom
          (boolean_lit))
        (stmt
          (expr_atom
            (boolean_lit)))
        (stmt
          (expr_atom
            (boolean_lit))))
      (stmt
        (expr_atom
          (int_lit))))))
