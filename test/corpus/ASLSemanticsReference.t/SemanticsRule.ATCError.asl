=====
ASLSemanticsReference.t/SemanticsRule.ATCError.asl
=====
func main () => integer
begin

  let my_ctc = (3 as integer {3..5});

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
            (pattern
              (expr_atom
                (int_lit))
              (ty
                (constraint
                  (constraint_range
                    (expr_atom
                      (int_lit))
                    (expr_atom
                      (int_lit)))))))))
      (stmt
        (expr_atom
          (int_lit))))))
