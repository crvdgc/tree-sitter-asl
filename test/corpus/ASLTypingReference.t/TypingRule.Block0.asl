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
        (boolean_lit)
        (stmt
          (decl_stmt
            (identifier)
            (int_lit)))
        (stmt
          (identifier)
          (identifier)
          (identifier)))
      (stmt
        (decl_stmt
          (identifier)
          (string_lit)))
      (stmt
        (identifier)
        (identifier))
      (stmt
        (int_lit)))))
