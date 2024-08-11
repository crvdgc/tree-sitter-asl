=====
ASLSemanticsReference.t/SemanticsRule.SAssignCall.asl
=====
func f(x:integer) => (integer, integer)
begin
  return (x,x+1);
end

func main() => integer
begin
  var a,b : integer;

  (a,b) = f(1);

  assert (a+b == 3);
  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty))
    (ty
      (ty)
      (ty))
    (subprogram_body
      (stmt
        (expr_atom
          (pattern
            (expr_atom
              (identifier)))
          (pattern
            (expr_atom
              (identifier))
            (binop_add_sub_logic)
            (expr_atom
              (int_lit)))))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (identifier)
          (ty)))
      (stmt
        (lexpr_atom
          (identifier))
        (lexpr_atom
          (identifier))
        (expr_atom
          (identifier)
          (expr_atom
            (int_lit))))
      (stmt
        (expr_atom
          (pattern
            (expr_atom
              (identifier))
            (binop_add_sub_logic)
            (expr_atom
              (identifier))
            (binop_comparison)
            (expr_atom
              (int_lit)))))
      (stmt
        (expr_atom
          (int_lit))))))
