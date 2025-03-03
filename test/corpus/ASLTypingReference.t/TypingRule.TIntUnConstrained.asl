=====
ASLTypingReference.t/TypingRule.TIntUnConstrained.asl
=====
type MyType of integer;
func foo (x: integer) => integer
begin
  return x;
end

func main () => integer
begin
  var x: integer;

  x = 4;
  x = foo (x as integer);

  let y: integer = x;

  assert x as integer == x;

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
          (int_lit)))
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
