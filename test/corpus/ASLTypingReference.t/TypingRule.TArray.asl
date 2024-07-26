=====
ASLTypingReference.t/TypingRule.TArray.asl
=====
type MyType of array [4] of integer;

func foo (x: array [4] of integer) => array [4] of integer
begin
  var y = x;
  y[3] = 2;
  return y;
end

func main () => integer
begin
  var x: array [4] of integer;

  x[1] = 1;
  print(x);
  x = foo (x as array [4] of integer);

  let y: array [4] of integer = x;


  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (expr_atom
        (int_lit))
      (ty)))
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty
        (expr_atom
          (int_lit))
        (ty)))
    (ty
      (expr_atom
        (int_lit))
      (ty))
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (expr_atom
            (identifier))))
      (stmt
        (lexpr_atom
          (lexpr_atom
            (identifier))
          (slice
            (expr_atom
              (int_lit))))
        (expr_atom
          (int_lit)))
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
            (expr_atom
              (int_lit))
            (ty))))
      (stmt
        (lexpr_atom
          (lexpr_atom
            (identifier))
          (slice
            (expr_atom
              (int_lit))))
        (expr_atom
          (int_lit)))
      (stmt
        (identifier)
        (expr_atom
          (identifier)))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (identifier)
          (expr_atom
            (identifier))
          (ty
            (expr_atom
              (int_lit))
            (ty))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (expr_atom
              (int_lit))
            (ty))
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (int_lit))))))
