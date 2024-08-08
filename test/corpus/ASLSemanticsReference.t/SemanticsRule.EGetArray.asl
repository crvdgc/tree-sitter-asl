=====
ASLSemanticsReference.t/SemanticsRule.EGetArray.asl
=====
type MyArrayType of array [3] of integer;

var my_array : MyArrayType;

func main () => integer
begin

  my_array[2]=42;
  assert my_array[2]==42;

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
        (lexpr_atom
          (lexpr_atom
            (identifier))
          (slice
            (expr_atom
              (int_lit))))
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (expr_atom
            (identifier))
          (slice
            (expr_atom
              (int_lit))))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
