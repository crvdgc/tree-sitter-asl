=====
ASLSemanticsReference.t/SemanticsRule.ECondFALSE.asl
=====
func Return42() => integer
begin
  return 42;
end

func main () => integer
begin

  let x = if FALSE then Return42() else 3;
  assert x==3;

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
          (expr_atom
            (boolean_lit))
          (expr_atom
            (identifier))
          (expr_atom
            (int_lit))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
