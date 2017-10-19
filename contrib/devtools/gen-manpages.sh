#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

SCHEZUANCOIND=${SCHEZUANCOIND:-$SRCDIR/schezuancoind}
SCHEZUANCOINCLI=${SCHEZUANCOINCLI:-$SRCDIR/schezuancoin-cli}
SCHEZUANCOINTX=${SCHEZUANCOINTX:-$SRCDIR/schezuancoin-tx}
SCHEZUANCOINQT=${SCHEZUANCOINQT:-$SRCDIR/qt/schezuancoin-qt}

[ ! -x $SCHEZUANCOIND ] && echo "$SCHEZUANCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
SZCVER=($($SCHEZUANCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for schezuancoind if --version-string is not set,
# but has different outcomes for schezuancoin-qt and schezuancoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$SCHEZUANCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $SCHEZUANCOIND $SCHEZUANCOINCLI $SCHEZUANCOINTX $SCHEZUANCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${SZCVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${SZCVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
