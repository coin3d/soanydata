#! /bin/sh

# Regenerate all files which are constructed by the autoconf, automake
# and libtool tool-chain. Note: only developers should need to use
# this script.

# Authors:
#   Morten Eriksen <mortene@sim.no>
#   Lars J. Aas <larsa@sim.no>
#   Ralph Levien (original autogen.sh picked up from Gnome source archive).

directory=`echo "$0" | sed -e 's/[^\/]*$//g'`;
cd $directory
if ! test -f ./autogen.sh; then
  echo "unexpected problem with your shell - bailing out"
  exit 1
fi

AUTOCONF_VER=2.14a    # Autoconf from CVS
AUTOMAKE_VER=1.4a     # Automake from CVS
LIBTOOL_VER=1.3.5

MACRODIR=../conf-macros
DIE=false

if test "$1" = "--clean"; then
  rm -f aclocal.m4 \
	config.guess \
	config.h.in \
	config.sub \
	configure \
	depcomp \
	install-sh \
	ltconfig \
	ltmain.sh \
	missing \
	mkinstalldirs \
	stamp-h*
  find . -type f -name Makefile.in -print | xargs rm
  exit 0
elif test "$1" = "--add"; then
  AUTOMAKE_ADD="--add-missing --gnu --copy"
fi

echo "Checking the installed configuration tools..."

if test -z "`autoconf --version | grep \" $AUTOCONF_VER\" 2> /dev/null`"; then
    echo
    echo "You must have autoconf version $AUTOCONF_VER installed to"
    echo "generate configure information and Makefiles for $PROJECT."
    echo ""
    echo "The Autoconf version we are using is a development version"
    echo "\"frozen\" from the CVS repository at 2000-01-13. You can get"
    echo "it here:"
    echo ""
    echo "   ftp://ftp.sim.no/pub/coin/autoconf-2.14.1-coin.tar.gz"
    echo ""
    DIE=true
fi

if test -z "`automake --version | grep \" $AUTOMAKE_VER\" 2> /dev/null`"; then
    echo
    echo "You must have automake version $AUTOMAKE_VER installed to"
    echo "generate configure information and Makefiles for $PROJECT."
    echo ""
    echo "The Automake version we are using is a development version"
    echo "\"frozen\" from the CVS repository at 2000-01-13. You can get"
    echo "it here:"
    echo ""
    echo "   ftp://ftp.sim.no/pub/coin/automake-1.4a-coin.tar.gz"
    echo ""
    DIE=true
fi

if test -z "`libtool --version | grep \" $LIBTOOL_VER \" 2> /dev/null`"; then
    echo
    echo "You must have libtool version $LIBTOOL_VER installed to"
    echo "generate configure information and Makefiles for $PROJECT."
    echo ""
    echo "Get ftp://ftp.gnu.org/pub/gnu/libtool/libtool-1.3.5.tar.gz"
    echo ""
    DIE=true
fi

# set $SUBPROJECTNAMES
# num=1
# for project in $SUBPROJECTS; do
#   test -d $project || {
#     echo "Could not find subdirectory '$project'."
#     echo "It was probably added after you initially fetched $PROJECT."
#     echo "To add the missing module, run 'cvs co $1' from the $PROJECT"
#     echo "base directory."
#     echo ""
#     echo "To do a completely fresh cvs checkout of the whole $PROJECT module,"
#     echo "(if all else fails), remove $PROJECT and run:"
#     echo ""
#     echo "  cvs -z3 -d :pserver:cvs@cvs.sim.no:/export/cvsroot co -P $PROJECT"
#     echo ""
#     DIE=true
#   }
#   num=`expr $num + 1`
#   shift
# done

$DIE && exit 1

# AG_CRUNCH
echo "Running aclocal (generating aclocal.m4)..."
aclocal -I $MACRODIR

echo "Running autoheader (generating config.h.in)..."
autoheader

echo "Running automake (generating the Makefile.in files)..."
echo "[ignore any \"directory should not contain '/'\" warning]"
automake $AUTOMAKE_ADD

AMBUGFIXES=`find . \( -name Makefile.in.diff \) | egrep -v '^\./(data|examples|ivexamples)'`

fixmsg=0
for bugfix in $AMBUGFIXES; do
  if test $fixmsg -eq 0; then
    echo "[correcting automake bugs]"
    fixmsg=1
  fi
  patch -p0 < $bugfix
done

echo "Running autoconf (generating ./configure)..."
autoconf

echo
echo "Done: Now run './configure' and 'make install' to build $PROJECT."
echo

