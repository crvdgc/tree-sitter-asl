=====
ASLSemanticsReference.t/SemanticsRule.EUndefIdent.asl
=====
func main () => integer
begin

  let x = 42;
  assert y;

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
          (identifier)
          (expr_atom
            (int_lit))))
      (stmt
        (expr_atom
          (identifier)))
      (stmt
        (expr_atom
          (int_lit))))))
