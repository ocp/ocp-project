# Root project Makefile
.DEFAULT_GOAL := help

export NAMESPACE := ocp
export SERVICE := project
export KEY := $(NAMESPACE).$(SERVICE)

export ROOT := $(CURDIR)
export HEAD := $(shell git rev-parse --short HEAD)
export IMAGE_PREFIX := ghcr.io/$(NAMESPACE)/$(KEY)

-include Makefiles/Makefile.generate
-include Makefiles/Makefile.infra
-include Makefiles/Makefile.ops

help:
	@echo "Usage: make [option]"
	@echo "Makefile for running development tasks. Requires gmake."
	@echo ""
	@echo "  help                  show this message"
	@echo "  init                  initialize the developer environment"
	@echo ""
	@$(MAKE) generate.help
	@$(MAKE) infra.help
	@$(MAKE) ops.help
.PHONY: help

init: _infra.init
.PHONY: init

### Private (non-interface) targets.
_confirm:
	@echo "DESTRUCTIVE OPERATION - Are you sure? [y/N] " && \
		read ans && [ $${ans:-N} = y ]
.PHONY: _confirm
