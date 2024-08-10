=====
ASLSemanticsReference.t/SemanticsRule.LDUninitialisedTuple.asl
=====
func main () => integer
begin

  var (x : integer, y : boolean);

  assert x == 0 && y == TRUE;

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
          (ty)
          (identifier)
          (ty)))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit))
        (binop_boolean)
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (boolean_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
