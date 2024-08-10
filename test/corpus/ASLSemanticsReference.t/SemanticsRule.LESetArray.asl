=====
ASLSemanticsReference.t/SemanticsRule.LESetArray.asl
=====
func main () => integer
begin

  var my_array: array [42] of integer;
  my_array[3] = 53;
  assert my_array[3] == 53;

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
          (ty
            (expr_atom
              (int_lit))
            (ty))))
      (stmt
        (lexpr_atom
          (lexpr_atom
            (identifier))
          (slice
            (expr_atom
              (int_lit))))
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (expr_atom
            (identifier))
          (slice
            (expr_atom
              (int_lit))))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
