module.exports = grammar({
  name: 'asl',

  // adhere to the spec
  inline: $ => [
    $.program,
    $.decl_list,
    $.stmt_list,
    $.parameters_opt,
    $.parameter_list,
    $.formal_list,
    $.return_ty_opt,
    $.ty_opt,
    $.stmt_list,
  ],

  rules: {
    source_file: $ => $.program,

    // TODO: comment
    // TODO: literals

    identifier: $ => /[a-zA-Z_][a-zA-Z_0-9]*/,

    // TODO: identifier_list
    // TODO: identifier_trailing
    // TODO: identifier_trailing_list

    program: $ => $.decl_list,

    // TODO: annotation

    decl_list: $ => repeat($.decl),

    decl: $ => choice(
      // TODO: other decl
      $.function_decl
    ),

    // TODO: type_decl
    // TODO: field, field_list
    // TODO: storage_decl

    subprogram_body: $ => seq(
      'begin',
      $.stmt_list,
      'end'
    ),

    function_decl: $ => seq(
      'func',
      $.identifier,
      $.parameters_opt,
      '(',
      $.formal_list,
      ')',
      $.return_ty_opt,
      $.subprogram_body
    ),

    return_ty_opt: $ => optional(seq(
      '=>',
      $.ty
    )),

    // TODO: args_opt
    // TODO: getter_decl
    // TODO: setter_decl

    parameters_opt: $ => optional(seq(
      '{',
      parameter_list,
      '}'
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
      seq('integer', optional($.constraint)),
      // TODO: other tys
      'real'
    ),

    // TODO: constraint_opt
    // TODO: bitfields_opt
    // TODO: fields_opt
    // TODO: with_opt
    // TODO: bitwidth
    // TODO: constraint
    // TODO: constraint_range
    // TODO: constraint_range_list

    ty_opt: $ => optional(seq(
      ':',
      $.ty
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
    // TODO: expr
    // TODO: elsif_expr
    // TODO: elsif_expr_list
    // TODO: cexpr
    // TODO: cexpr_cmp
    // TODO: cexpr_add_sub
    // TODO: cexpr_mul_div
    // TODO: cexpr_pow
    // TODO: binop_boolean
    // TODO: binop_comparison
    // TODO: binop_add_sub_logic
    // TODO: binop_mul_div_shift
    // TODO: binop_pow
    // TODO: unop
    // TODO: binop_in
    // TODO: bexpr
    // TODO: expr_term
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

