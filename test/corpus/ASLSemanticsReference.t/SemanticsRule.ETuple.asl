=====
ASLSemanticsReference.t/SemanticsRule.ETuple.asl
=====
func Return42() => integer
begin
  return 42;
end

func main () => integer
begin

  let (x,y) = (3, Return42());
  assert x == 3;
  assert y == 42;

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
          (int_lit)))))
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
                (identifier))))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
