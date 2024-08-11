=====
ASLSemanticsReference.t/SemanticsRule.SAssignTuple.asl
=====
func main () => integer
begin
  var x : integer;
  var b : boolean;

  (b,x) = (TRUE,42);

  assert (b && x == 42);
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
          (ty)))
      (stmt
        (decl_stmt
          (identifier)
          (ty)))
      (stmt
        (lexpr_atom
          (identifier))
        (lexpr_atom
          (identifier))
        (expr_atom
          (pattern
            (expr_atom
              (boolean_lit)))
          (pattern
            (expr_atom
              (int_lit)))))
      (stmt
        (expr_atom
          (pattern
            (expr_atom
              (identifier))
            (binop_boolean)
            (expr_atom
              (identifier))
            (binop_comparison)
            (expr_atom
              (int_lit)))))
      (stmt
        (expr_atom
          (int_lit))))))
