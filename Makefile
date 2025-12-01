# Root project Makefile
.DEFAULT_GOAL := help

export NAMESPACE := ocp
export SERVICE := project
export KEY := $(NAMESPACE).$(SERVICE)

export ROOT := $(CURDIR)

-include Makefiles/Makefile.generate
-include Makefiles/Makefile.infra

help:
	@echo "Usage: make [option]"
	@echo "Makefile for running development tasks. Requires gmake."
	@echo ""
	@echo "  help            show this message"
	@echo ""
	@$(MAKE) generate.help
	@$(MAKE) infra.help
.PHONY: help

### Private (non-interface) targets.
_confirm:
	@echo "DESTRUCTIVE OPERATION - Are you sure? [y/N] " && \
		read ans && [ $${ans:-N} = y ]
.PHONY: _confirm
