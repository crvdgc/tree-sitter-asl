=====
ASLTypingReference.t/TypingRule.TBitField.asl
=====
type MyType of bits(4) { [3:2] A, [1] B };

func foo (x: bits(4) { [3:2] A, [1] B }) => bits(4) { [3:2] A, [1] B }
begin
  return x;
end

func main () => integer
begin
  var x: bits(4) { [3:2] A, [1] B };

  x = '1010';
  x = foo (x as bits(4) { [3:2] A, [1] B });

  let y: bits(4) { [3:2] A, [1] B } = x;

  assert x as integer == x;
  // assert x as bits(4) { [3:2] A, [1] B } == x;

  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (bitwidth
        (expr_atom
          (int_lit)))
      (bitfield
        (slice
          (expr_atom
            (int_lit))
          (expr_atom
            (int_lit)))
        (identifier))
      (bitfield
        (slice
          (expr_atom
            (int_lit)))
        (identifier))))
  (function_decl
    (identifier)
    (formal
      (identifier)
      (ty
        (bitwidth
          (expr_atom
            (int_lit)))
        (bitfield
          (slice
            (expr_atom
              (int_lit))
            (expr_atom
              (int_lit)))
          (identifier))
        (bitfield
          (slice
            (expr_atom
              (int_lit)))
          (identifier))))
    (ty
      (bitwidth
        (expr_atom
          (int_lit)))
      (bitfield
        (slice
          (expr_atom
            (int_lit))
          (expr_atom
            (int_lit)))
        (identifier))
      (bitfield
        (slice
          (expr_atom
            (int_lit)))
        (identifier)))
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
          (ty
            (bitwidth
              (expr_atom
                (int_lit)))
            (bitfield
              (slice
                (expr_atom
                  (int_lit))
                (expr_atom
                  (int_lit)))
              (identifier))
            (bitfield
              (slice
                (expr_atom
                  (int_lit)))
              (identifier)))))
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
                (int_lit)))
            (bitfield
              (slice
                (expr_atom
                  (int_lit))
                (expr_atom
                  (int_lit)))
              (identifier))
            (bitfield
              (slice
                (expr_atom
                  (int_lit)))
              (identifier)))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (bitwidth
              (expr_atom
                (int_lit)))
            (bitfield
              (slice
                (expr_atom
                  (int_lit))
                (expr_atom
                  (int_lit)))
              (identifier))
            (bitfield
              (slice
                (expr_atom
                  (int_lit)))
              (identifier)))
          (expr_atom
            (identifier))))
      (stmt
        (expr_atom
          (identifier))
        (ty)
        (binop_comparison)
        (expr_atom
          (identifier)))
      (comment)
      (stmt
        (expr_atom
          (int_lit))))))
