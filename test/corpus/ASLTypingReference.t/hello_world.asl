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
        (string_lit))
      (stmt
        (int_lit)))))
