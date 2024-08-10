=====
ASLSemanticsReference.t/SemanticsRule.LEGlobalVar.asl
=====
var x: integer = 3;

func main () => integer
begin

  x = 42;
  assert x==42;

  return 0;
end
---

(source_file
  (storage_decl
    (identifier)
    (ty)
    (expr_atom
      (int_lit)))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
