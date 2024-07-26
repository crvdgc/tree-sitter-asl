=====
ASLTypingReference.t/TypingRule.TBool.asl
=====
type MyType of boolean;

func foo (x: boolean) => boolean
begin
  return FALSE --> x;
end

func main () => integer
begin
  var x: boolean;

  x = TRUE;
  x = foo (x as boolean);

  let y: boolean = x && x;

  assert x as boolean == x;

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
          (boolean_lit))
        (binop_boolean)
        (expr_atom
          (identifier)))))
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
          (boolean_lit)))
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
          (binop_boolean)
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
