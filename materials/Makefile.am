############################################################################
## SoXt/data/materials/Makefile.am
## $Id$

SUBDIRS = . \
	artdeco autumn glass metal neon rococo santafe \
	sheen silky spring summer tropical winter

BUILT_SOURCES = \
	materials.h

noinst_HEADERS = $(BUILT_SOURCES)

############################################################################

materials.h: $(srcdir)/materials.h.in
	@( cd $(top_builddir); $(MAKE) built-sources )

############################################################################
