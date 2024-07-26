=====
ASLTypingReference.t/TypingRule.LDTuple.asl
=====
type MyT of (integer, integer {0..4}, boolean);

func main() => integer
begin
  let (x, -, y) = (5, 3, TRUE);

  assert x == 5 && y;
  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (ty)
      (ty
        (constraint
          (constraint_range
            (expr_atom
              (int_lit))
            (expr_atom
              (int_lit)))))
      (ty)))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (identifier)
          (expr_atom
            (pattern
              (expr_atom
                (int_lit)))
            (pattern
              (expr_atom
                (int_lit)))
            (pattern
              (expr_atom
                (boolean_lit))))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit))
        (binop_boolean)
        (expr_atom
          (identifier)))
      (stmt
        (expr_atom
          (int_lit))))))
