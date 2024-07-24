const sep = (rule, separator) => optional(sep1(rule, separator))
const sep1 = (rule, separator) => seq(rule, repeat(seq(separator, rule)))

module.exports = grammar({
  name: 'asl',

  extras: $ => [
    /\s/,  // does indent level actually change parsing?
    $._comment,
  ],

  // syntax rules cannot match empty string (except the start rule)
  // Such rules must be manually inlined (`inlined` list doesn't handle this
  // yet).
  // Generally this means `_opt` and `_list` non-terminals.

  rules: {
    // source_file: $ => $.program,
    source_file: $ => repeat($._decl),

    _comment: $ => token(choice(
      seq('//', /[^\n]*/),
      seq(
        '/*',
        /([^*]|\*[^\/])*/,
        '*/',
      )
    )),

    int_lit: $ => /[0-9][0-9_]*/,

    // TODO: hex_lit
    // TODO: real_lit

    string_lit: $ => seq(
      '"',
      /([^\"\\]|\\[nt\"\\])*/,
      '"',
    ),

    // TODO: bitvector_lit
    // TODO: bitmask_lit


    identifier: $ => /[a-zA-Z_][a-zA-Z_0-9]*/,

    // TODO: identifier_list
    // TODO: identifier_trailing
    // TODO: identifier_trailing_list

    // matches empty string, must be inlined to start symbol
    // program: $ => $.decl_list,

    // TODO: annotation

    // decl_list: $ => repeat($.decl),

    _decl: $ => choice(
      // TODO: other decl
      $.function_decl,
    ),

    // TODO: type_decl
    // TODO: field, field_list
    // TODO: storage_decl

    subprogram_body: $ => seq(
      'begin',
      // $.stmt_list,
      repeat($.stmt),
      'end',
    ),

    function_decl: $ => seq(
      'func',
      $.identifier,

      // $.parameters_opt,
      optional(seq(
        '{',
        // $.parameter_list,
        optional(
          sep($.parameter, ','),
        ),
        '}',
      )),

      '(',
      // $.formal_list,
      sep($.formal, ','),
      ')',

      // $.return_ty_opt,
      optional(seq(
        '=>',
        $.ty,
      )),

      $.subprogram_body,
    ),

    // return_ty_opt: $ => optional(seq(
    //   '=>',
    //   $.ty,
    // )),

    // TODO: args_opt
    // TODO: getter_decl
    // TODO: setter_decl

    // parameters_opt: $ => optional(seq(
    //   '{',
    //   $.parameter_list,
    //   '}',
    // )),

    parameter: $ => seq(
      $.identifier,
      // $.ty_opt,
      optional(seq(
        ':',
        $.ty,
      )),
    ),

    // parameter_list: $ => optional(
    //   sep($.parameter, ','),
    // ),

    formal: $ => seq(
      $.identifier,
      ':',
      $.ty,
    ),

    // formal_list: $ => sep($.formal, ','),

    ty: $ => choice(
      $.identifier,
      'boolean',
      seq(
        'integer',
        // $.constraint_opt
        optional($.constraint),
      ),
      // TODO: other tys
      'real',
    ),

    // constraint_opt: $ => optional($.constraint),

    // TODO: bitfields_opt
    // TODO: fields_opt
    // TODO: with_opt
    // TODO: bitwidth

    constraint: $ => seq(
      '{',
      $.constraint_range_list,
      '}',
    ),

    constraint_range: $ => choice(
      $._expr,
      seq($._expr, '..', $._expr),
    ),

    constraint_range_list: $ => sep1($.constraint_range, ','),

    // ty_opt: $ => optional(seq(
    //   ':',
    //   $.ty,
    // )),

    // TODO: ty_list
    // TODO: bitfield_spec
    // TODO: bitfield
    // TODO: bitfield_list

    stmt: $ => choice(
      seq(
        'return',
        // $._expr_opt
        optional($._expr),
        ';',
      ),
      seq('pass', ';'),
      // TODO: other stmts
      // extra
      seq(
        'print',
        '(',
        sep($._expr, ','),
        ')',
        ';',
      )
    ),

    // stmt_list: $ => repeat($.stmt),

    // TODO: decl_stmt
    // TODO: decl_item
    // TODO: decl_item_list
    // TODO: l_expr
    // TODO: l_expr_list
    // TODO: l_expr_atom
    // TODO: l_expr_atom_list
    // TODO: elsif
    // TODO: elsif_list
    // TODO: else_opt
    // TODO: alt
    // TODO: where_opt
    // TODO: alt_list
    // TODO: otherwise_opt
    // TODO: pattern
    // TODO: pattern_set
    // TODO: pattern_list
    // TODO: direction
    // TODO: catcher
    // TODO: catcher_list
    // TODO: expr_opt
    // TODO: expr_list

    // null_or_expr: $ => $._expr,

    // null_or_expr_list: $ => sep($.null_or_expr_list, ','),

    _expr: $ => choice(
      // TODO: if then else expr
      $._c_expr,
    ),

    // TODO: elsif_expr
    // TODO: elsif_expr_list

    _c_expr: $ => choice(
      // TODO: other _c_expr
      $._c_expr_cmp,
    ),

    _c_expr_cmp: $ => choice(
      // TODO: binop_comparison
      $._c_expr_add_sub,
    ),

    _c_expr_add_sub: $ => choice(
      // TODO: binop_add_sub_logic
      $._c_expr_mul_div,
    ),

    _c_expr_mul_div: $ => choice(
      // TODO: binop_mul_div_shift
      $._c_expr_pow,
    ),

    _c_expr_pow: $ => choice(
      // TODO: _c_expr_pow
      $._b_expr,
    ),

    // TODO: binop_boolean
    // TODO: binop_comparison
    // TODO: binop_add_sub_logic
    // TODO: binop_mul_div_shift
    // TODO: binop_pow
    // TODO: unop
    // TODO: binop_in

    _b_expr: $ => choice(
      // TODO: unop
      $._expr_term,
    ),

    _expr_term: $ => choice(
      // TODO: other expr_term
      seq(
        'UNKNOWN',
        ':',
        $.ty,
      ),
      $._expr_atom,
    ),

    _expr_atom: $ => choice(
      $.identifier,
      seq(
        $.identifier,
        '(',
        // $.null_or_expr_list
        sep($._expr, ','),
        ')',
      ),
      // TODO: field_assignment_list
      $._literal_expr,
      // TODO: other expr atom
    ),

    // TODO: field_assignment
    // TODO: field_assignment_list
    // TODO: checked_type_constraint
    // TODO: slice
    // TODO: slice_list
    // TODO: null_or_slice
    // TODO: null_or_slice_list
    _literal_expr: $ => choice(
      $.int_lit,
      $.string_lit,
      // TODO: other literal_expr
    ),
  }
});

