=====
ASLTypingReference.t/TypingRule.BuiltinSingularTypes.asl
=====
func main () => integer
begin
  let i : integer = 0;
  let r : real = 0.0;
  let s : string = "0.0";
  let b : boolean = TRUE;
  let z4 : bits(4) = '0000';
  let o2 : bits(2) = '11';
  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (ty)
          (expr_atom
            (int_lit))))
      (stmt
        (decl_stmt
          (identifier)
          (ty)
          (expr_atom
            (real_lit))))
      (stmt
        (decl_stmt
          (identifier)
          (ty)
          (expr_atom
            (string_lit))))
      (stmt
        (decl_stmt
          (identifier)
          (ty)
          (expr_atom
            (boolean_lit))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (bitwidth
              (expr_atom
                (int_lit))))
          (expr_atom
            (bitvector_lit))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (bitwidth
              (expr_atom
                (int_lit))))
          (expr_atom
            (bitvector_lit))))
      (stmt
        (expr_atom
          (int_lit))))))
