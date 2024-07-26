=====
ASLTypingReference.t/TypingRule.TIntUnderConstrained.asl
=====
func foo {N} (x: bits(N)) => integer
begin
  return N;
end

func bar (N: integer) => bits(N)
begin
  return Zeros(N);
end

func main() => integer
begin
  assert 3 == foo ('101');
  assert bar(3) == '000';

  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (parameter
      (identifier))
    (formal
      (identifier)
      (ty
        (bitwidth
          (expr_atom
            (identifier)))))
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (identifier)))))
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty))
    (ty
      (bitwidth
        (expr_atom
          (identifier))))
    (subprogram_body
      (stmt
        (expr_atom
          (identifier)
          (expr_atom
            (identifier))))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (int_lit))
        (binop_comparison)
        (expr_atom
          (identifier)
          (expr_atom
            (bitvector_lit))))
      (stmt
        (expr_atom
          (identifier)
          (expr_atom
            (int_lit)))
        (binop_comparison)
        (expr_atom
          (bitvector_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
