=====
ASLTypingReference.t/TypingRule.TNamed.asl
=====
type MyType of integer;

func foo (x: MyType) => MyType
begin
  return x;
end

func main () => integer
begin
  var x: MyType;

  x = 4;
  x = foo (x as MyType);

  let y: MyType = x;

  assert x as MyType == x;

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
      (ty
        (identifier)))
    (ty
      (identifier))
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
            (identifier))))
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
            (identifier))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (identifier))
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (identifier))
        (ty
          (identifier))
        (binop_comparison)
        (expr_atom
          (identifier)))
      (stmt
        (expr_atom
          (int_lit))))))
