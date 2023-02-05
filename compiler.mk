ifndef TOOLCHAIN
$(error set TOOLCHAIN variable to gcc or clang in configure)
endif

GCC_WARNINGS = -Wall -Wextra -Wshadow -Wcast-align -Wunused -Wpedantic -Wconversion -Wsign-conversion -Wmisleading-indentation -Wduplicated-cond -Wduplicated-branches -Wlogical-op -Wnull-dereference -Wdouble-promotion -Wformat=2 -Wfloat-equal -Wundef -Wwrite-strings -Wunused-macros -Wmissing-declarations -Wcast-qual -Warith-conversion -Wswitch-default -Wswitch-outside-range -Walloc-zero -Wredundant-decls -Winline -Wuninitialized -Winit-self

C_WARNINGS = $(GCC_WARNINGS) -Wmissing-prototypes -Wstrict-prototypes

C_NO_WARNINGS = -Wno-declaration-after-statement -Wno-switch-enum -Wno-padded

CXX_WARNINGS = $(GCC_WARNINGS) -Wc++20-compat -Wpessimizing-move -Weffc++ -Wvexing-parse -Woverloaded-virtual -Wold-style-cast -Wnon-virtual-dtor -Wuseless-cast -Wextra-semi -Wconversion-null -Wsuggest-override

CXX_NO_WARNINGS = -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-switch-enum -Wno-padded

ARFLAGS   = rcs
CXXFLAGS  = -std=c++20 -Werror
CFLAGS    = -std=c2x -Werror

ifeq (${TOOLCHAIN},"gcc")
CC=gcc-11
CFLAGS += ${C_WARNINGS} ${C_NO_WARNINGS}

CXX=g++-11
CXXFLAGS += ${CXX_WARNINGS} ${CXX_NO_WARNINGS}

else ifeq (${TOOLCHAIN},"clang")
CC=clang-15
CFLAGS += -Weverything ${C_NO_WARNINGS}

CXX=clang++-15
CXXFLAGS += -Weverything  ${CXX_NO_WARNINGS} -stdlib=libc++
CXX_LDFLAGS=-lc++

else
$(error Unexpected value in TOOLCHAIN: ${TOOLCHAIN})

endif
