=====
Comments
=====

// this is a comment
func f()
begin
  /* block comment test
     // does not terminate
     /* does not start a new block
  ends here */
  print(x);
end

---

(source_file
  (comment)
  (function_decl
    (identifier)
    (subprogram_body
      (comment)
      (stmt
        (identifier)
        (identifier)))))
