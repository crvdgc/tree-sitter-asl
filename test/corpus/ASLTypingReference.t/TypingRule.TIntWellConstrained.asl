=====
ASLTypingReference.t/TypingRule.TIntWellConstrained.asl
=====
type MyType of integer {1..12};

func foo (x: integer {1..12}) => integer {1..12}
begin
  return x;
end

func main () => integer
begin
  var x: integer {1..12};

  x = 4;
  x = foo (x as integer {1..12});

  let y: integer {1..12} = x;

  assert x as integer {1..11} == x;

  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (constraint
        (constraint_range
          (expr_atom
            (int_lit))
          (expr_atom
            (int_lit))))))
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty
        (constraint
          (constraint_range
            (expr_atom
              (int_lit))
            (expr_atom
              (int_lit))))))
    (ty
      (constraint
        (constraint_range
          (expr_atom
            (int_lit))
          (expr_atom
            (int_lit)))))
    (subprogram_body
      (stmt
        (expr_atom
          (identifier)))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (constraint
              (constraint_range
                (expr_atom
                  (int_lit))
                (expr_atom
                  (int_lit)))))))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (int_lit)))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (identifier)
          (expr_atom
            (identifier))
          (ty
            (constraint
              (constraint_range
                (expr_atom
                  (int_lit))
                (expr_atom
                  (int_lit)))))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (constraint
              (constraint_range
                (expr_atom
                  (int_lit))
                (expr_atom
                  (int_lit)))))
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (identifier))
        (ty
          (constraint
            (constraint_range
              (expr_atom
                (int_lit))
              (expr_atom
                (int_lit)))))
        (binop_comparison)
        (expr_atom
          (identifier)))
      (stmt
        (expr_atom
          (int_lit))))))
