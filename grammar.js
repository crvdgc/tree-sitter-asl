const sep = (rule, separator) => optional(sep1(rule, separator))
const sep1 = (rule, separator) => seq(rule, repeat(seq(separator, rule)))
const sep1_tr = (rule, separator) => seq(sep1(rule, separator), optional(separator))

module.exports = grammar({
  name: 'asl',

  extras: $ => [
    /\s/,  // does indent level actually change parsing?
           // maybe should be moved to externals
    $.comment,
  ],

  precedences: $ => [
    [$.expr_atom, $._expr_term],
  ],

  conflicts: $ => [
    [$.expr_atom],
  ],

  // syntax rules cannot match empty string (except the start rule)
  // Such rules must be manually inlined (`inlined` list doesn't handle this
  // yet).
  // Generally this means `_opt` and `_list` non-terminals.

  rules: {
    // source_file: $ => $.program,
    source_file: $ => repeat($._decl),

    comment: $ => token(choice(
      seq('//', /[^\n]*/),
      seq(
        '/*',
        /([^*]|\*[^\/])*/,
        '*/',
      )
    )),

    boolean_lit: $ => choice(
      'TRUE',
      'FALSE',
    ),

    int_lit: $ => /[0-9][0-9_]*/,

    hex_lit: $ => /0x[0-9a-fA-F][0-9a-fA-F_]*/,

    real_lit: $ => /[0-9][0-9_]*\.[0-9][0-9_]*/,

    string_lit: $ => seq(
      '"',
      /([^\"\\]|\\[nt\"\\])*/,
      '"',
    ),

    // TODO: bitvector_lit

    bitmask_lit: $ => /\'[01x ]*\'/,


    identifier: $ => /[a-zA-Z_][a-zA-Z_0-9]*/,

    // identifier_list: $ => sep1($.identifier, ','),

    // identifier_trailing: $ => $.identifier,

    _identifier_trailing_list: $ => sep1_tr($.identifier, ','),

    // matches empty string, must be inlined to start symbol
    // program: $ => $.decl_list,

    annotation: $ => seq(
      '@',
      $.identifier,
      '(',
      // $.null_or_expr_list
      sep($._expr, ','),
      ')',
    ),

    // decl_list: $ => repeat($.decl),

    _decl: $ => choice(
      seq($.annotation, $._decl),
      $.function_decl,
      $.type_decl,
      // TODO: other decl
    ),

    type_decl: $ => choice(
      seq(
        'type',
        $.identifier,
        'of',
        $.ty,
        'subtypes',
        $.ty,
        ';',
      ),
      seq(
        'type',
        $.identifier,
        'of',
        $.ty,
        ';',
      ),
      seq(
        'type',
        $.identifier,
        'of',
        $.ty,
        'subtypes',
        $.ty,
        // $.with_opt
        // NOTE: the empty 'with' case is subsumed
        'with',
        // $.fields_opt
        optional(seq(
          '{',
          // $.field_list,
          sep($.field, ','),
          '}',
        )),
        ';',
      ),
    ),

    field: $ => seq($.identifier, ':', $.ty),

    // field_list: $ => sep($.field, ','),

    // TODO: storage_decl

    subprogram_body: $ => seq(
      'begin',
      $._stmt_list,
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
      'real',
      'string',
      'bit',
      seq(
        'bits',
        '(',
        $.bitwidth,
        ')',
        // $.bitfields_opt
        optional(seq(
          '{',
          // $.bitfield_list
          sep($.bitfield, ','),
          '}',
        )),
      ),
      seq(
        'enumeration',
        '{',
        // $._identifier_trailing_list,
    sep1_tr($.identifier, ','),
        '}',
      ),
      seq(
        '(',
        // $.ty_list,
        sep($.ty, ','),
        ')',
      ),
      seq(
        'array',
        '[',
        $._expr,
        ']',
        'of',
        $.ty,
      ),
      seq(
        'record',
        // $.fields_opt
        optional(seq(
          '{',
          // $.field_list,
          sep($.field, ','),
          '}',
        )),
      ),
      seq(
        'exception',
        // $.fields_opt
        optional(seq(
          '{',
          // $.field_list,
          sep($.field, ','),
          '}',
        )),
      ),
    ),

    // constraint_opt: $ => optional($.constraint),

    // bitfields_opt: $ => optional(seq(
    //   '{',
    //   // $.bitfield_list
    //   sep($.bitfield, ','),
    //   '}',
    // )),

    // fields_opt: $ => optional(seq(
    //   '{',
    //   $.field_list,
    //   '}',
    // )),

    with_opt: $ => seq(
        'with',
        // $.fields_opt
        optional(seq(
          '{',
          // $.field_list,
          sep($.field, ','),
          '}',
        )),
    ),

    bitwidth: $ => choice(
      $._expr,
      seq('-', ':', $.ty),
      $.constraint
    ),

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

    // ty_list: $ => sep($.ty, ','),

    bitfield_spec: $ => choice(
      seq(':', $.ty),
      // $.bitfields_opt
      optional(seq(
        '{',
        // $.bitfield_list
        sep($.bitfield, ','),
        '}',
      )),
    ),

    bitfield: $ => seq(
      '[',
      // $.slice_list,
      sep1_tr($.slice, ','),
      ']',
      $.identifier,
      // $.bitfield_spec,
      choice(
        seq(':', $.ty),
        // $.bitfields_opt
        optional(seq(
          '{',
          // $.bitfield_list
          sep($.bitfield, ','),
          '}',
        )),
      ),
    ),

    // bitfield_list: $ => sep($.bitfield, ','),

    stmt: $ => choice(
      // TODO: annotation stmt
      $.decl_stmt,
      seq(
        $._l_expr,
        '=',
        $._expr
      ),
      // "print" statement is also parsed as a func call
      seq(
        $.identifier,
        '(',
        // $.null_or_expr_list
        sep($._expr, ','),
        ')',
        ';',
      ),
      seq(
        'return',
        // $._expr_opt
        optional($._expr),
        ';',
      ),
      seq(
        'assert',
        $._expr,
        ';'
      ),
      seq(
        'throw',
        // $.expr_opt
        optional($._expr),
        ';'
      ),
      seq('pass', ';'),
      seq(
        'if',
        $._expr,
        'then',
        $._stmt_list,
        // $.elsif_list
        repeat($.elsif),
        // $.else_opt
        optional(seq('else', $._stmt_list)),
        'end',
      )
      // TODO: other stmts
    ),

    _stmt_list: $ => seq($.stmt, repeat($.stmt)),

    decl_stmt: $ => choice(
      seq(
        'var',
        $.identifier,
        ':',
        $.ty,
        ';'
      ),
      seq(
        'var',
        $.identifier,
        ',',
        // $.identifier_list
        sep1($.identifier, ','),
        ':',
        $.ty,
        ';'
      ),
      seq(
        'var',
        $._decl_item,
        '=',
        $._expr,
        ';',
      ),
      seq(
        'let',
        $._decl_item,
        '=',
        $._expr,
        ';',
      ),
      seq(
        'constant',
        $._decl_item,
        '=',
        $._expr,
        ';',
      ),
    ),

    _decl_item: $ => choice(
      seq(
        $.identifier,
        // $.ty_opt
        optional($.ty),
      ),
      seq(
        '(',
        // $.decl_item_list
        sep1($._decl_item, ','),
        ')',
        // $.ty_opt
        optional($.ty),
      ),
      seq(
        '[',
        // $.decl_item_list
        sep1($._decl_item, ','),
        ']',
        // $.ty_opt
        optional($.ty),
      ),
      seq(
        '-',
        // $.ty_opt
        optional($.ty),
      ),
    ),

    // TODO: decl_item_list

    _l_expr: $ => choice(
      '-',
      $.lexpr_atom,
      seq(
        '(',
        // $._l_expr_list
        sep1($._l_expr, ','),
        ')',
      ),
    ),

    // _l_expr_list: $ => sep1($._l_expr, ','),

    lexpr_atom: $ => choice(
      $.identifier,
      seq($.lexpr_atom, '.', $.identifier),
      seq(
        $.lexpr_atom,
        '.',
        '[',
        // $.identifier_list
        sep1($.identifier, ','),
        ']',
        ),
      seq(
        '[',
        // $.lexpr_atom_list
        sep1($.lexpr_atom, ','),
        ']',
      ),
      seq(
        $.lexpr_atom,
        '[',
        // $.null_or_slice_list
        sep($.slice, ','),
        ']',
      ),
    ),

    // lexpr_atom_list: sep1($.lexpr_atom, ','),

    elsif: $ => seq(
      'elsif',
      $._expr,
      'then',
      $._stmt_list,
    ),

    // elsif_list: $ => repeat($.elsif)

    // $.else_opt = $ => optional(seq('else', $._stmt_list)),

    // TODO: alt
    // TODO: where_opt
    // TODO: alt_list
    // TODO: otherwise_opt

    pattern: $ => choice(
      '-',
      $._expr,
      seq($._expr, '..', $._expr),
      seq('<=', $._expr),
      seq('>=', $._expr),
      $.pattern_set,
    ),

    pattern_set: $ => choice(
      seq(
        '{',
        // $.pattern_list,
        sep1($.pattern, ','),
        '}',
      ),
      seq(
        '!',
        '{',
        // $.pattern_list,
        sep1($.pattern, ','),
        '}',
      ),
      $.bitmask_lit,
    ),

    // pattern_list: $ => sep1($.pattern, ','),

    // TODO: direction
    // TODO: catcher
    // TODO: catcher_list
    // TODO: expr_opt

    // expr_list: $ => sep($._expr, ','),

    // null_or_expr: $ => $._expr,

    // null_or_expr_list: $ => sep($.null_or_expr_list, ','),

    _expr: $ => choice(
      // TODO: if then else expr
      $._c_expr,
    ),

    // TODO: elsif_expr
    // TODO: elsif_expr_list

    _c_expr: $ => prec.left(choice(
      // TODO: other _c_expr
      $._c_expr_cmp,
    )),

    _c_expr_cmp: $ => choice(
      seq(
        $._c_expr_cmp,
        $.binop_comparison,
        $._c_expr_add_sub,
      ),
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

    binop_boolean: $ => choice(
      '&&',
      '||',
      '-->',
      '<->',
    ),

    binop_comparison: $ => choice(
      '==',
      '!=',
      '>',
      '>=',
      '<',
      '<=',
    ),

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
      $.expr_atom,
    ),

    expr_atom: $ => choice(
      $.identifier,
      seq(
        $.identifier,
        '(',
        // $.null_or_expr_list
        sep($._expr, ','),
        ')',
      ),
      seq(
        $.identifier,
        // $.field_assignment_list,
        '{',
        sep($.field_assignment, ','),
        '}',
      ),
      $._literal_expr,
      seq(
        $.expr_atom,
        '[',
        // $.null_or_slice_list,
        sep($.slice, ','),
        ']',
      ),
      seq(
        $.expr_atom,
        '.',
        $.identifier,
      ),
      seq(
        $.expr_atom,
        '.',
        '[',
        // $.identifier_list,
        sep1($.identifier, ','),
        ']',
      ),
      seq(
        '(',
        // $.pattern_list,
        sep1($.pattern, ','),
        ')',
      ),
      seq(
        '[',
        // $.expr_list,
        sep($._expr, ','),
        ']',
      ),
    ),

    field_assignment: $ => seq($.identifier, '=', $._expr),

    // field_assignment_list: $ => sep($.field_assignment, ','),

    // TODO: checked_type_constraint

    slice: $ => choice(
      $._expr,
      seq($._expr, ':', $._expr),
      seq($._expr, '+:', $._expr),
      seq($._expr, '*:', $._expr),
    ),

    // slice_list: $ => sep1_tr($.slice, ','),

    // null_or_slice: $ => $.slice,

    // null_or_slice_list: $ => sep($.null_or_slice, ','),

    _literal_expr: $ => choice(
      $.int_lit,
      $.hex_lit,
      $.real_lit,
      // TODO: bitvector_lit
      $.string_lit,
      $.boolean_lit,
    ),
  }
});

