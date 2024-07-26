=====
ASLTypingReference.t/TypingRule.LDVar.asl
=====
func main () => integer
begin
  let x = 3;
  assert x == 3;

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
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
