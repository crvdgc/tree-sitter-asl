=====
Print statement
=====

func f()
begin
  print(x);
end

---

(source_file
  (function_decl
    (identifier)
    (subprogram_body
      (stmt
        (identifier)
        (expr_atom
          (identifier))))))
