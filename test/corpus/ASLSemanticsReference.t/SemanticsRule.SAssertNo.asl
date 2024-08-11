=====
ASLSemanticsReference.t/SemanticsRule.SAssertNo.asl
=====
func main () => integer
begin

  assert (42 == 3);

  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (pattern
            (expr_atom
              (int_lit))
            (binop_comparison)
            (expr_atom
              (int_lit)))))
      (stmt
        (expr_atom
          (int_lit))))))
