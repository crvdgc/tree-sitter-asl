=====
ASLTypingReference.t/TypingRule.Block0.asl
=====
    func main () => integer
    begin
      if TRUE then
         let i = 3;
         print (DecStr (i));
      end
      let i = "Some text";
      print (i);
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
          (boolean_lit))
        (stmt
          (decl_stmt
            (identifier)
            (expr_atom
              (int_lit))))
        (stmt
          (identifier)
          (expr_atom
            (identifier)
            (expr_atom
              (identifier)))))
      (stmt
        (decl_stmt
          (identifier)
          (expr_atom
            (string_lit))))
      (stmt
        (identifier)
        (expr_atom
          (identifier)))
      (stmt
        (expr_atom
          (int_lit))))))
