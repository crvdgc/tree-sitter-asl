=====
ASLTypingReference.t/TypingRule.LDTyped.asl
=====
type MyT of integer;

func foo (t: MyT) => integer
begin
  return t as integer;
end

func main () => integer
begin
  let x: MyT = 42;
  var z: MyT;

  assert foo (x) == 42;
  assert foo (z) == 0;

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
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (identifier))
        (ty))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (identifier))
          (expr_atom
            (int_lit))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (identifier))))
      (stmt
        (expr_atom
          (identifier)
          (expr_atom
            (identifier)))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (identifier)
          (expr_atom
            (identifier)))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
