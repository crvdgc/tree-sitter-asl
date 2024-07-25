=====
ASLTypingReference.t/TypingRule.BuiltinAggregateTypes.asl
=====
type Pair of (integer, boolean);

type T of array [3] of real;
type Coord of enumeration { CX, CY, CZ };
type PointArray of array [Coord] of real;

type PointRecord of record
  { x : real, y : real, z : real };

func main () => integer
begin
  let p = (0, FALSE);

  var t1 : T; var t2 : PointArray;
  assert (t1[0] == t2[CX]);

  let o = PointRecord { x=0.0, y=0.0, z=0.0 };
  assert (t2[CZ] == o.z);

  return 0;
end

---

(source_file
  (type_decl
    (identifier)
    (ty
      (ty)
      (ty)))
  (type_decl
    (identifier)
    (ty
      (int_lit)
      (ty)))
  (type_decl
    (identifier)
    (ty
      (identifier)
      (identifier)
      (identifier)))
  (type_decl
    (identifier)
    (ty
      (identifier)
      (ty)))
  (type_decl
    (identifier)
    (ty
      (field
        (identifier)
        (ty))
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
          (pattern
            (int_lit))
          (pattern
            (boolean_lit))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (identifier))))
      (stmt
        (decl_stmt
          (identifier)
          (ty
            (identifier))))
      (stmt
        (pattern
          (identifier)
          (slice
            (int_lit))
          (binop_comparison)
          (identifier)
          (slice
            (identifier))))
      (stmt
        (decl_stmt
          (identifier)
          (identifier)
          (field_assignment
            (identifier)
            (real_lit))
          (field_assignment
            (identifier)
            (real_lit))
          (field_assignment
            (identifier)
            (real_lit))))
      (stmt
        (pattern
          (identifier)
          (slice
            (identifier))
          (binop_comparison)
          (identifier)
          (identifier)))
      (stmt
        (int_lit)))))
