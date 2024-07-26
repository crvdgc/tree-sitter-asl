=====
ASLTypingReference.t/TypingRule.TString.asl
=====
type MyType of string;

func foo (x: string) => string
begin
  return x;
end

func main () => integer
begin
  var x: string;

  x = "foo";
  x = foo (x as string);

  let y: string = x;

  assert x as string == x;

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
          (string_lit)))
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
