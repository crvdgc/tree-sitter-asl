(source_file) @local.scope ; global definiton
(function_decl) @local.scope
(type_decl (identifier) @local.definition)
(type_decl (ty) @local.definition)
(type_decl (ty "enumeration" (identifier) @local.definition))
(type_decl (ty "record" (field (identifier) @local.definition)))
(decl_stmt (identifier) @local.definition)
(lexpr_atom (identifier) @local.definition)
(identifier) @local.reference
