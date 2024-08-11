=====
ASLSemanticsReference.t/SemanticsRule.LEUndefIdentV1.asl
=====
func main () => integer
begin

  let x = 42;
  y = 3;

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
        (lexpr_atom
          (identifier))
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
