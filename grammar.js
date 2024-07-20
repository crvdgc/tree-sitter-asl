const sep = (rule, separator) => optional(sep1(rule, separator))
const sep1 = (rule, separator) => seq(rule, repeat(seq(separator, rule)))

module.exports = grammar({
  name: 'asl',

  // adhere to the spec
  inline: $ => [
    // rules that match empty string, must be manually inlined
    // $.program,    // inlined
    // $.decl_list,  // inlined
    // $.stmt_list,  // inlined
    $.parameters_opt,
    $.parameter_list,
    $.formal_list,
    $.constraint_opt,
    $.return_ty_opt,
    $.ty_opt,
  ],

  rules: {
    // matches empty string, must be inlined to start symbol
    // source_file: $ => $.program,
    source_file: $ => repeat($.decl),

    // TODO: comment
    // TODO: literals

    identifier: $ => /[a-zA-Z_][a-zA-Z_0-9]*/,

    // TODO: identifier_list
    // TODO: identifier_trailing
    // TODO: identifier_trailing_list

    // matches empty string, must be inlined to start symbol
    // program: $ => $.decl_list,

    // TODO: annotation

    // decl_list: $ => repeat($.decl),

    decl: $ => choice(
      // TODO: other decl
      $.function_decl,
    ),

    // TODO: type_decl
    // TODO: field, field_list
    // TODO: storage_decl

    subprogram_body: $ => seq(
      'begin',
      $.stmt_list,
      'end',
    ),

    function_decl: $ => seq(
      'func',
      $.identifier,
      $.parameters_opt,
      '(',
      $.formal_list,
      ')',
      $.return_ty_opt,
      $.subprogram_body,
    ),

    return_ty_opt: $ => optional(seq(
      '=>',
      $.ty,
    )),

    // TODO: args_opt
    // TODO: getter_decl
    // TODO: setter_decl

    parameters_opt: $ => optional(seq(
      '{',
      $.parameter_list,
      '}',
    )),

    parameter: $ => seq(
      $.identifier,
      $.ty_opt,
    ),

    parameter_list: $ => optional(
      sep($.parameter, ','),
    ),

    formal: $ => seq(
      $.identifier,
      ':',
      $.ty,
    ),

    formal_list: $ => sep($.formal, ','),

    ty: $ => choice(
      $.identifier,
      'boolean',
      seq('integer', $.constraint_opt),
      // TODO: other tys
      'real',
    ),

    constraint_opt: $ => optional($.constraint),

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
      $.expr,
      seq($.expr, '..', $.expr),
    ),

    constraint_range_list: $ => sep1($.constraint_range, ','),

    ty_opt: $ => optional(seq(
      ':',
      $.ty,
    )),

    // TODO: ty_list
    // TODO: bitfield_spec
    // TODO: bitfield
    // TODO: bitfield_list

    stmt: $ => choice(
      'pass',
      // TODO: other stmts
    ),

    stmt_list: $ => repeat($.stmt),

    // TODO: decl_stmt
    // TODO: decl_item
    // TODO: decl_item_list
    // TODO: lexpr
    // TODO: lexpr_list
    // TODO: lexpr_atom
    // TODO: lexpr_atom_list
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
    // TODO: null_or_expr
    // TODO: null_or_expr_list

    expr: $ => choice(
      // TODO: if then else expr
      $.cexpr,
    ),

    // TODO: elsif_expr
    // TODO: elsif_expr_list

    cexpr: $ => choice(
      // TODO: other cexpr
      $.cexpr_cmp,
    ),

    cexpr_cmp: $ => choice(
      // TODO: binop_comparison
      $.cexpr_add_sub,
    ),

    cexpr_add_sub: $ => choice(
      // TODO: binop_add_sub_logic
      $.cexpr_mul_div,
    ),

    cexpr_mul_div: $ => choice(
      // TODO: binop_mul_div_shift
      $.cexpr_pow,
    ),

    cexpr_pow: $ => choice(
      // TODO: cexpr_pow
      $.bexpr,
    ),

    // TODO: binop_boolean
    // TODO: binop_comparison
    // TODO: binop_add_sub_logic
    // TODO: binop_mul_div_shift
    // TODO: binop_pow
    // TODO: unop
    // TODO: binop_in

    bexpr: $ => choice(
      // TODO: unop
      $.expr_term,
    ),

    expr_term: $ => choice(
      // TODO: other expr_term
      'UNKNOWN',
      ':',
      $.ty,
    ),

    // TODO: expr_atom
    // TODO: field_assignment
    // TODO: field_assignment_list
    // TODO: checked_type_constraint
    // TODO: slice
    // TODO: slice_list
    // TODO: null_or_slice
    // TODO: null_or_slice_list
    // TODO: literal_expr
  }
});

