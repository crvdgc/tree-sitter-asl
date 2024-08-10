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
    [$._cexpr_cmp, $._cexpr],
  ],

  conflicts: $ => [],

  // syntax rules cannot match empty string (except the start rule)
  // Such rules must be manually inlined (`inlined` list doesn't handle this
  // yet).
  // Generally this means `_opt` and `_list` non-terminals.

  rules: {
    // source_file: $ => optional($.program),
    source_file: $ => repeat($._decl),

    // program: $ => seq($._decl, repeat($._decl)),

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

    bitvector_lit: $ => /\'[01 ]*\'/,

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
      $.type_decl,
      $.storage_decl,
      $.function_decl,
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

    storage_decl: $ => choice(
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
        // $.ty_opt,
        optional(seq(':', $.ty)),
        '=',
        $._expr,
        ';'
      ),
      seq(
        'let',
        $.identifier,
        // $.ty_opt,
        optional(seq(':', $.ty)),
        '=',
        $._expr,
        ';',
      ),
      seq(
        'constant',
        $.identifier,
        // $.ty_opt,
        optional(seq(':', $.ty)),
        '=',
        $._expr,
        ';',
      ),
      seq(
        'config',
        $.identifier,
        // $.ty_opt,
        optional(seq(':', $.ty)),
        '=',
        $._expr,
        ';',
      ),
    ),

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
      optional(seq(':', $.ty)),
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
      $._constraint_range_list,
      '}',
    ),

    constraint_range: $ => choice(
      $._expr,
      seq($._expr, '..', $._expr),
    ),

    _constraint_range_list: $ => sep1($.constraint_range, ','),

    // ty_opt: $ => optional(seq(':', $.ty)),

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
      seq($.annotation, $.stmt),
      $.decl_stmt,
      seq(
        $._l_expr,
        '=',
        $._expr,
        ';',
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
      ),
      // TODO: case stmt
      seq(
        'for',
        $.identifier,
        '=',
        $._expr,
        $.direction,
        $._expr,
        'do',
        $._stmt_list,
        'end',
      ),
      seq(
        'while',
        $._expr,
        'do',
        $._stmt_list,
        'end',
      ),
      // TODO: repeat stmt
      seq(
        'try',
        $._stmt_list,
        'catch',
        // $.catcher_list
        repeat($.catcher),
        // $.otherwise_opt
        optional(seq(
          'otherwise',
          '=>',
          $._stmt_list,
        )),
        'end',
      ),
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
        optional(seq(':', $.ty)),
      ),
      seq(
        '(',
        // $.decl_item_list
        sep1($._decl_item, ','),
        ')',
        // $.ty_opt
        optional(seq(':', $.ty)),
      ),
      seq(
        '[',
        // $.decl_item_list
        sep1($._decl_item, ','),
        ']',
        // $.ty_opt
        optional(seq(':', $.ty)),
      ),
      seq(
        '-',
        // $.ty_opt
        optional(seq(':', $.ty)),
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

    // otherwise_opt: $ => optional(seq(
    //   'otherwise',
    //   '=>',
    //   $._stmt_list,
    // )),

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

    direction: $ => choice('to', 'downto'),

    catcher: $ => choice(
      seq(
        'when',
        $.identifier,
        ':',
        $.ty,
        '=>',
        $._stmt_list,
      ),
      seq(
        'when',
        $.ty,
        '=>',
        $._stmt_list,
      ),
    ),

    // catcher_list: $ => repeat($.catcher)

    // expr_opt: $ => optional($._expr)

    // expr_list: $ => sep($._expr, ','),

    // null_or_expr: $ => $._expr,

    // null_or_expr_list: $ => sep($.null_or_expr_list, ','),

    _expr: $ => choice(
      seq(
        'if',
        $._cexpr,
        'then',
        $._expr,
        // $.elsif_expr_list
        repeat($.elsif_expr),
        'else',
        $._expr,
      ),
      $._cexpr,
    ),

    elsif_expr: $ => seq(
      'elsif',
      $._expr,
      'then',
      $._expr,
    ),

    elsif_expr_list: $ => repeat($.elsif_expr),

    _cexpr: $ => choice(
      seq(
        $._cexpr,
        $.binop_boolean,
        $._cexpr_cmp
      ),
      // NOTE: reference manual may be wrong to only place it here.
      //
      // Because this will allow only `binop_boolean` to connect
      // _checked_type_constraint, preventing e.g.
      // `x as string == x` from
      // ASLTypingReference.t/TypingRule.TString.asl.
      //
      // The parser from asllib and asl-interpreter both allow arbitrary binop
      // to occur between _checked_type_constraint.
      seq(
        $._cexpr,
        $._checked_type_constraint,
      ),
      $._cexpr_cmp,
    ),

    _cexpr_cmp: $ => choice(
      seq(
        $._cexpr_cmp,
        $.binop_comparison,
        $._cexpr_add_sub,
      ),
      seq(
        $._cexpr_cmp,
        $._checked_type_constraint,
      ),
      $._cexpr_add_sub,
    ),

    _cexpr_add_sub: $ => choice(
      seq(
        $._cexpr_add_sub,
        $.binop_add_sub_logic,
        $._cexpr_mul_div,
      ),
      $._cexpr_mul_div,
    ),

    _cexpr_mul_div: $ => choice(
      seq(
        $._cexpr_mul_div,
        $.binop_mul_div_shift,
        $._cexpr_pow,
      ),
      $._cexpr_pow,
    ),

    _cexpr_pow: $ => choice(
      seq(
        $._cexpr_pow,
        $.binop_pow,
        $._bexpr,
      ),
      $._bexpr,
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

    binop_add_sub_logic: $ => choice(
      '+',
      '-',
      'OR',
      'XOR',
      'AND',
    ),

    binop_mul_div_shift: $ => choice(
      '*',
      '/',
      'DIV',
      'DIVRM',
      'MOD',
      '<<',
      '>>',
    ),

    binop_pow: $ => '^',

    unop: $ => choice(
      '-',
      '!',
      'NOT',
    ),

    binop_in: $ => 'IN',

    _bexpr: $ => choice(
      seq($.unop, $._bexpr),
      $._expr_term,
    ),

    _expr_term: $ => choice(
      seq(
        $.expr_atom,
        $.binop_in,
        $.pattern_set,
      ),
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

    _checked_type_constraint: $ => choice(
      seq('as', $.ty),
      seq('as', $.constraint),
    ),

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
      $.bitvector_lit,
      $.string_lit,
      $.boolean_lit,
    ),
  }
});

