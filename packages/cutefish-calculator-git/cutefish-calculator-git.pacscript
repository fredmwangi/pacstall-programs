name="cutefish-calculator-git"
gives="cutefish-calculator"
version="0.1-1"
url="https://github.com/cutefishos/calculator.git"
license="GPL-3.0"
build_depends=("extra-cmake-modules" "ninja-build" "qttools5-dev-tools" "qtbase5-dev" "qtdeclarative5-dev" "qtquickcontrols2-5-dev" "qttools5-dev")
depends=("fishui" "libcutefish")
description="CutefishOS Calculator."

pkgver() {
  git ls-remote "${url}" main | cut -f1 | cut -c1-8
}
version="$(pkgver)"

prepare() {
  mkdir build
  cd build
}

build() {
  cmake ..
  make -j"$(nproc)"
}

install() {
  sudo make install DESTDIR="${pkgdir}"
}
