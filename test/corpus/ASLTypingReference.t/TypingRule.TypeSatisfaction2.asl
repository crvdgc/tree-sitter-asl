=====
ASLTypingReference.t/TypingRule.TypeSatisfaction2.asl
=====
type T1 of integer;
  // the named type `T1` whose structure is integer
type T2 of integer;
  // the named type `T2` whose structure is integer
type pairT of (integer, T1);
  // the named type `pairT` whose structure is (integer, integer)

func main() => integer
begin
  var dataT1: T1;
  var pair: pairT = (1,dataT1);

  let dataAsInt: integer = dataT1;
  pair = (1, dataAsInt);
  // legal since the right-hand-side has anonymous,
  // primitive type (integer, integer)
  return 0;
end
---

(source_file
  (type_decl
    (identifier)
    (ty))
  (comment)
  (type_decl
    (identifier)
    (ty))
  (comment)
  (type_decl
    (identifier)
    (ty
      (ty)
      (ty
        (identifier))))
  (comment)
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (identifier))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (identifier))
          (expr_atom
            (pattern
              (expr_atom
                (int_lit)))
            (pattern
              (expr_atom
                (identifier))))))
      (stmt
        (decl_stmt
          (identifier)
          (ty)
          (expr_atom
            (identifier))))
      (stmt
        (lexpr_atom
          (identifier))
        (expr_atom
          (pattern
            (expr_atom
              (int_lit)))
          (pattern
            (expr_atom
              (identifier)))))
      (comment)
      (comment)
      (stmt
        (expr_atom
          (int_lit))))))
