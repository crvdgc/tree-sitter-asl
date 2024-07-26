=====
ASLTypingReference.t/TypingRule.LDDiscard.asl
=====
func main () => integer
begin

  let - = 42;
  let - = "abc";
  let - = '101010';

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
          (expr_atom
            (int_lit))))
      (stmt
        (decl_stmt
          (expr_atom
            (string_lit))))
      (stmt
        (decl_stmt
          (expr_atom
            (bitvector_lit))))
      (stmt
        (expr_atom
          (int_lit))))))
