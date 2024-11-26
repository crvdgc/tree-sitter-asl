# `tree-sitter` parser for Architecture Specification Language

An unofficial [tree-sitter](https://tree-sitter.github.io/) parser for Arm's [Architecture Specification Language](https://developer.arm.com/Architectures/Architecture%20Specification%20Language) (ASL).

ASL itself has multiple versions and there are multiple syntax implementations, which all served as sources of the parser. The specifications and implementations are as follows, ordered from latest to earliest:

1. [Implementation] The official [ASL Reference Interpreter](https://github.com/herd/herdtools7/tree/master/asllib).
2. [Specification] The official [ASL Reference](https://developer.arm.com/Architectures/Architecture%20Specification%20Language) (DDI0626).
3. [Specification] Architecture Specification Language - Language Reference Manual (DDI0612, deprecated).
4. [Implementation] The [original interpreter](https://github.com/ARM-software/asl-interpreter) (deprecated).

The [grammar](./grammar.js) is mainly based on 3, but also incorporates syntax variants from 1 and 4. The relaxation is because the goal is to perform quick and robust semantic syntax highlighting, rather than to completely parse a specific language version. In terms of 2's versioning, the grammar is closest to ASLv1.

This project is still a work-in-progress. Some planned improvements are:

1. Refactor the grammar to use TypeScript to inline production rules which matches the empty string, rather than copy-paste definitions.
2. Overtime, migrate to the official interpreter's [syntax](https://github.com/herd/herdtools7/blob/master/asllib/Parser.mly) (1 from the above list).
3. Release supporting software, including a [neovim](https://neovim.io/) plugin for [`nvim-treesitter`](https://github.com/nvim-treesitter/nvim-treesitter/) and a binary for HTML syntax highlighting.

This a personal project, with no official affiliations with Arm. Opinions expressed in this project are personal and not a reflection of those of my employer. For more information, see [the license](./LICENSE).

