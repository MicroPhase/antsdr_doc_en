# # Minimal makefile for Sphinx documentation
# #

# # You can set these variables from the command line, and also
# # from the environment for the first two.
# SPHINXOPTS    ?=
# SPHINXBUILD   ?= sphinx-build
# SOURCEDIR     = source_cn
# SOURCEDIR     = source

# BUILDDIR      = build

# # Put it first so that "make" without argument is like "make help".
# help:
# 	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# .PHONY: help Makefile

# # Catch-all target: route all unknown targets to Sphinx using the new
# # "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
# %: Makefile
# 	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)


# Minimal makefile for Sphinx documentation

SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@echo "make en     # build English documentation"
	@echo "make cn     # build Chinese documentation"

.PHONY: help en cn Makefile

# Build English docs
html:
	@$(SPHINXBUILD) -M html source $(BUILDDIR)/html $(SPHINXOPTS) $(O)
	@$(SPHINXBUILD) -M html source_cn $(BUILDDIR)/html/cn $(SPHINXOPTS) $(O)
# Build Chinese docs
#cn:
	
