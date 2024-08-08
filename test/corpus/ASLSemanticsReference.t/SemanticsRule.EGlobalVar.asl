=====
ASLSemanticsReference.t/SemanticsRule.EGlobalVar.asl
=====
var global_x: integer = 3;

func main () => integer
  begin

    assert global_x == 3;
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
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
