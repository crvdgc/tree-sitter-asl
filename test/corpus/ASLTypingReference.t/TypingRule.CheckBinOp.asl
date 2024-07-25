=====
ASLTypingReference.t/TypingRule.CheckBinOp.asl
=====
func main() => integer
begin
  var a: bits(10);
  var b: bits(10);
  var c: bits(10) = a XOR b; // Check that XOR operator is recognized by the lexer.
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
                (int_lit))))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (bitwidth
              (expr_atom
                (int_lit))))
          (expr_atom
            (identifier))
          (binop_add_sub_logic)
          (expr_atom
            (identifier))))
      (comment)
      (stmt
        (expr_atom
          (int_lit))))))
