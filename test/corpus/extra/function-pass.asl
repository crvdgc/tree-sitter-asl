=====
Function with pass as its body
=====

func f()
begin
  pass;
end

---

(source_file
  (function_decl
    (identifier)
    (subprogram_body
      (stmt))))
