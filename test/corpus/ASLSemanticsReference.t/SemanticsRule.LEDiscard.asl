=====
ASLSemanticsReference.t/SemanticsRule.LEDiscard.asl
=====
func main () => integer
begin

  - = 42;
  assert TRUE;

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
          (int_lit)))
      (stmt
        (expr_atom
          (boolean_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
