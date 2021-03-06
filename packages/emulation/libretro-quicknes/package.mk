################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="libretro-quicknes"
PKG_VERSION="646fad9"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/QuickNES_Core"
PKG_URL="https://github.com/libretro/QuickNES_Core/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="QuickNES_Core-$PKG_VERSION*"
PKG_DEPENDS_TARGET="toolchain kodi-platform"
PKG_SECTION="emulation"
PKG_SHORTDESC="game.libretro.quicknes: QuickNES for Kodi"
PKG_LONGDESC="game.libretro.quicknes: QuickNES for Kodi"
PKG_AUTORECONF="no"
PKG_IS_ADDON="no"

PKG_LIBNAME="quicknes_libretro.so"
PKG_LIBPATH="$PKG_LIBNAME"
PKG_LIBVAR="QUICKNES_LIB"

make_target() {
  make
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib
  cp $PKG_LIBPATH $INSTALL/usr/lib/$PKG_LIBNAME
  echo "set($PKG_LIBVAR $INSTALL/usr/lib/$PKG_LIBNAME)" > $SYSROOT_PREFIX/usr/$PKG_NAME-config.cmake
}

