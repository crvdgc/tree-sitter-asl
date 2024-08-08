=====
ASLSemanticsReference.t/SemanticsRule.EGetArrayTooSmall.asl
=====
type MyArrayType of array [3] of integer;

var my_array : MyArrayType;

func main () => integer
begin
  print(my_array[3]);
  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (expr_atom
        (int_lit))
      (ty)))
  (storage_decl
    (identifier)
    (ty
      (identifier)))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (identifier)
        (expr_atom
          (expr_atom
            (identifier))
          (slice
            (expr_atom
              (int_lit)))))
      (stmt
        (expr_atom
          (int_lit))))))
