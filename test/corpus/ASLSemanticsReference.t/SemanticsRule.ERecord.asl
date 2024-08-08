=====
ASLSemanticsReference.t/SemanticsRule.ERecord.asl
=====
type MyRecordType of record {a: integer, b: integer};

func main () => integer
begin

  let my_record = MyRecordType{a=3, b=42};
  assert my_record.a == 3;

  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty
      (field
        (identifier)
        (ty))
      (field
        (identifier)
        (ty))))
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (expr_atom
            (identifier)
            (field_assignment
              (identifier)
              (expr_atom
                (int_lit)))
            (field_assignment
              (identifier)
              (expr_atom
                (int_lit))))))
      (stmt
        (expr_atom
          (expr_atom
            (identifier))
          (identifier))
        (binop_comparison)
        (expr_atom
          (int_lit)))
      (stmt
        (expr_atom
          (int_lit))))))
