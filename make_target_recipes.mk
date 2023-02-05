define make-c-application
app = $1
srcs = $2
objs = $(subst .c,.o, $$(srcs))
APPLICATIONS += $$(BINDIR)/$$(app)

$$(BINDIR)/$$(app): $$(objs)
	$(CC) $(CFLAGS) -o $$@ $$^ $3
	@printf "\033[1m-- built \033[92m$$@\033[0m\n"

PHONY_APPLICATION_TARGETS += $$(app)
$$(app): $$(BINDIR)/$$(app)
	make --always-make $$(BINDIR)/$$@
.PHONY: $$(app)
endef

define make-cxx-application
app = $1
srcs = $2
objs = $(subst .c,.o, $$(srcs))
APPLICATIONS += $$(BINDIR)/$$(app)

$$(BINDIR)/$$(app): $$(objs)
	$(CXX) $(CXXFLAGS) $(CXX_LDFLAGS) -o $$@ $$^
	@printf "\033[1m-- built \033[92m$$@\033[0m\n"

PHONY_APPLICATION_TARGETS += $$(app)
$$(app): $$(BINDIR)/$$(app)
	make --always-make $$(BINDIR)/$$@
.PHONY: $$(app)
endef

define make-static-library
LIBRARIES += $1
$1: $2
	@$(AR) $(ARFLAGS) $$@ $$^
	@printf "\033[1m-- built \033[92m$$@\033[0m\n"
endef

