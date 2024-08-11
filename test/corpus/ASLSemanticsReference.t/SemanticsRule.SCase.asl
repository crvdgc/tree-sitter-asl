=====
ASLSemanticsReference.t/SemanticsRule.SCase.asl
=====
func main () => integer
begin

  case 3 of
    when 42: assert FALSE;
    when <= 42: assert TRUE;
    otherwise: assert FALSE;
  end

  return 0;
end
---

(source_file
  (function_decl
    (identifier)
    (ty)
    (subprogram_body
      (stmt
        (expr_atom
          (int_lit))
        (alt
          (pattern
            (expr_atom
              (int_lit)))
          (stmt
            (expr_atom
              (boolean_lit))))
        (alt
          (pattern
            (expr_atom
              (int_lit)))
          (stmt
            (expr_atom
              (boolean_lit))))
        (stmt
          (expr_atom
            (boolean_lit))))
      (stmt
        (expr_atom
          (int_lit))))))
