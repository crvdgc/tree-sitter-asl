=====
Hello World
=====

func main() => integer
begin
  print("Hello world!");
  return 0;
end

---

(source_file
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (identifier)
        (expr_atom
          (string_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
