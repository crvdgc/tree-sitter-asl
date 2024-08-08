=====
ASLSemanticsReference.t/SemanticsRule.ATCValue.asl
=====
func main () => integer
begin

  let my_ctc = 3 as integer;
  assert my_ctc == 3;

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
            (int_lit))
          (ty)))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
