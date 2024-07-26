=====
ASLTypingReference.t/TypingRule.TBits.asl
=====
type MyType of bits(4);

func foo (x: bits(4)) => bits(4)
begin
  return NOT x;
end

func main () => integer
begin
  var x: bits(4);

  x = '1010';
  x = foo (x as bits(4));

  let y: bits(4) = x;

  assert x as bits(4) == x;

  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (bitwidth
        (expr_atom
          (int_lit)))))
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty
        (bitwidth
          (expr_atom
            (int_lit)))))
    (ty
      (bitwidth
        (expr_atom
          (int_lit))))
    (subprogram_body
      (stmt
        (unop)
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
            (bitwidth
              (expr_atom
                (int_lit))))))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (bitvector_lit)))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (identifier)
          (expr_atom
            (identifier))
          (ty
            (bitwidth
              (expr_atom
                (int_lit))))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (bitwidth
              (expr_atom
                (int_lit))))
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (identifier))
        (ty
          (bitwidth
            (expr_atom
              (int_lit))))
        (binop_comparison)
        (expr_atom
          (identifier)))
      (stmt
        (expr_atom
          (int_lit))))))
