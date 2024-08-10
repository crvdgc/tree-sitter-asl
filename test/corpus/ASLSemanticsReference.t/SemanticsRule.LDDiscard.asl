=====
ASLSemanticsReference.t/SemanticsRule.LDDiscard.asl
=====
func main () => integer
begin

  var - : integer;
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
        (decl_stmt
          (ty)))
      (stmt
        (expr_atom
          (boolean_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
