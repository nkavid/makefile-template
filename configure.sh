#!/bin/bash

TOOLCHAIN=UNSET
SILENT=".SILENT:"

function usage()
{
  echo "usage: configure [--toolchain=*][--verbose]"
  echo ""
  echo "description: configures Makefile"
  echo ""
  echo "options:"
  echo -e "--verbose              enables recipe echoing"
  echo -e "--toolchain=<option>   select gcc or clang"
}

for opt do
  optval="${opt#*=}"
  case "$opt" in
    --toolchain=*)
      TOOLCHAIN=${optval}
      echo -e "\x1B[1m-- using toolchain ${TOOLCHAIN}\x1B[0m"
    ;;
    --verbose)
      SILENT="":
      echo -e "\x1B[1m-- removed .SILENT: from make\x1B[0m"
    ;;
    --help)
      usage && exit 0
    ;;
  esac
done


[ ! -d build ] && mkdir -p build/{bin,lib}
echo -e "\x1B[1m-- using build directory\x1B[0m"

[ ${TOOLCHAIN} = UNSET ] \
  && echo -e "\x1B[31;1merror, missing '--toolchain=*' option\x1B[0m" \
  && exit 1

cat > build/config.mk <<EOF
TOOLCHAIN = "${TOOLCHAIN}"
BINDIR = build/bin
LIBDIR = build/lib
${SILENT}
EOF

echo -e "\x1B[1m-- 'make help' info\x1B[0m"
