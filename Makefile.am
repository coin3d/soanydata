############################################################################
## So@GUI@/data/Makefile.am
## $Id$

SUBDIRS = bin materials

BUILT_SOURCES = \
	bin/iv2h.sh \
	materials/materials.h \
	materials/artdeco/artdeco.h \
	materials/autumn/autumn.h \
	materials/glass/glass.h \
	materials/metal/metal.h \
	materials/neon/neon.h \
	materials/rococo/rococo.h \
	materials/santafe/santafe.h \
	materials/sheen/sheen.h \
	materials/silky/silky.h \
	materials/spring/spring.h \
	materials/summer/summer.h \
	materials/tropical/tropical.h \
	materials/winter/winter.h

noinst_DATA = $(BUILT_SOURCES)

############################################################################

built-sources: $(BUILT_SOURCES)

bin/iv2h.sh: $(top_srcdir)/bin/iv2h.sh.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:bin/iv2h.sh.in ./config.status
	@chmod +x bin/iv2h.sh

materials/materials.h: $(top_srcdir)/materials/materials.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/materials.h.in \
	./config.status

materials/artdeco/artdeco.h: $(top_srcdir)/materials/artdeco/artdeco.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/artdeco/artdeco.h.in \
	./config.status

materials/autumn/autumn.h: $(top_srcdir)/materials/autumn/autumn.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/autumn/autumn.h.in \
	./config.status

materials/glass/glass.h: $(top_srcdir)/materials/glass/glass.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/glass/glass.h.in \
	./config.status

materials/metal/metal.h: $(top_srcdir)/materials/metal/metal.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/metal/metal.h.in \
	./config.status

materials/neon/neon.h: $(top_srcdir)/materials/neon/neon.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/neon/neon.h.in \
	./config.status

materials/rococo/rococo.h: $(top_srcdir)/materials/rococo/rococo.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/rococo/rococo.h.in \
	./config.status

materials/santafe/santafe.h: $(top_srcdir)/materials/santafe/santafe.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/santafe/santafe.h.in \
	./config.status

materials/sheen/sheen.h: $(top_srcdir)/materials/sheen/sheen.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/sheen/sheen.h.in \
	./config.status

materials/silky/silky.h: $(top_srcdir)/materials/silky/silky.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/silky/silky.h.in \
	./config.status

materials/spring/spring.h: $(top_srcdir)/materials/spring/spring.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/spring/spring.h.in \
	./config.status

materials/summer/summer.h: $(top_srcdir)/materials/summer/summer.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/summer/summer.h.in \
	./config.status

materials/tropical/tropical.h: $(top_srcdir)/materials/tropical/tropical.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/tropical/tropical.h.in \
	./config.status

materials/winter/winter.h: $(top_srcdir)/materials/winter/winter.h.in
	@CONFIG_HEADERS= CONFIG_FILES=$@:materials/winter/winter.h.in \
	./config.status

############################################################################
