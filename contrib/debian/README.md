
Debian
====================
This directory contains files used to package schezuancoind/schezuancoin-qt
for Debian-based Linux systems. If you compile schezuancoind/schezuancoin-qt yourself, there are some useful files here.

## schezuancoin: URI support ##


schezuancoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install schezuancoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your schezuancoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/schezuancoin128.png` to `/usr/share/pixmaps`

schezuancoin-qt.protocol (KDE)

