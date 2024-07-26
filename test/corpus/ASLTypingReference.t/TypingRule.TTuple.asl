=====
ASLTypingReference.t/TypingRule.TTuple.asl
=====
type MyType of (integer, boolean);

func foo (x: (integer, boolean)) => (integer, boolean)
begin
  let (z, y): (integer, boolean) = x;
  return (z + 1, FALSE --> y);
end

func main () => integer
begin
  var x: (integer, boolean);

  x = (3, TRUE);
  x = foo (x as (integer, boolean));

  let y: (integer, boolean) = x;

  let (x0, x1) = x as (integer, boolean);
  assert x0 == 4 && x1 == TRUE;

  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (ty)
      (ty)))
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty
        (ty)
        (ty)))
    (ty
      (ty)
      (ty))
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (identifier)
          (ty
            (ty)
            (ty))
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (pattern
            (expr_atom
              (identifier))
            (binop_add_sub_logic)
            (expr_atom
              (int_lit)))
          (pattern
            (expr_atom
              (boolean_lit))
            (binop_boolean)
            (expr_atom
              (identifier)))))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (ty)
            (ty))))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (pattern
            (expr_atom
              (int_lit)))
          (pattern
            (expr_atom
              (boolean_lit)))))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (identifier)
          (expr_atom
            (identifier))
          (ty
            (ty)
            (ty))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (ty)
            (ty))
          (expr_atom
            (identifier))))
      (stmt
        (decl_stmt
          (identifier)
          (identifier)
          (expr_atom
            (identifier))
          (ty
            (ty)
            (ty))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit))
        (binop_boolean)
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (boolean_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
