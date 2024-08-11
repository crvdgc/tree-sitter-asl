package tree_sitter_asl_test

import (
	"testing"

	tree_sitter "github.com/smacker/go-tree-sitter"
	"github.com/tree-sitter/tree-sitter-asl"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_asl.Language())
	if language == nil {
		t.Errorf("Error loading Asl grammar")
	}
}
