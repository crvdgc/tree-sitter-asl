=====
ASLSemanticsReference.t/SemanticsRule.ECondUNKNOWN3or42.asl
=====
func Return42() => integer
begin
  return 42;
end

func main () => integer
begin

  let x = if UNKNOWN: boolean then 3 else Return42();
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
          (ty)
          (expr_atom
            (int_lit))
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
