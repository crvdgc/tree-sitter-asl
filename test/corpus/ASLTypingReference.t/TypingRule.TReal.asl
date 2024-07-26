=====
ASLTypingReference.t/TypingRule.TReal.asl
=====
type MyType of real;

func foo (x: real) => real
begin
  return x + 1.0;
end

func main () => integer
begin
  var x: real;

  x = 3.141592;
  x = foo (x as real);

  let y: real = x + x;

  assert x as real == x;

  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty))
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty))
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (identifier))
        (binop_add_sub_logic)
        (expr_atom
          (real_lit)))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (ty)))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (real_lit)))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (identifier)
          (expr_atom
            (identifier))
          (ty)))
      (stmt
        (decl_stmt
          (identifier)
          (ty)
          (expr_atom
            (identifier))
          (binop_add_sub_logic)
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (identifier))
        (ty)
        (binop_comparison)
        (expr_atom
          (identifier)))
      (stmt
        (expr_atom
          (int_lit))))))
