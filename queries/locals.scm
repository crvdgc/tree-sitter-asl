(source_file) @local.scope ; global definitions
(function_decl) @local.scope
(getter_decl) @local.scope
(setter_decl) @local.scope

(type_decl (identifier) @local.definition)
(type_decl (ty) @local.definition)
(type_decl (ty "enumeration" (identifier) @local.definition))
(type_decl (ty "record" (field (identifier) @local.definition)))
(type_decl (ty "exception" (field (identifier) @local.definition)))
(parameter (identifier) @local.definition)
(formal (identifier) @local.definition)
(storage_decl (identifier) @local.definition)
(decl_stmt (identifier) @local.definition)

(identifier) @local.reference
