all: $(LIBRARIES) $(APPLICATIONS)
	@printf "\033[1m-- done $@\033[0m\n"
.PHONY: all

clean:
	find $(BINDIR) -type f -delete
	find $(LIBDIR) -type f -delete
	find src -name "*.o" -delete
	@echo "\033[1m-- cleaned\033[0m"
.PHONY: clean

clobber: clean
	rm -rf build
	@echo "\033[1m-- clobbered\033[0m"
.PHONY: clobber

help:
	@echo "Configuration:"
	@echo "-- TOOLCHAIN variable set to $(TOOLCHAIN) [gcc, clang]"
	@echo "-- Binary output BINDIR path is $(BINDIR)"
	@echo "-- Binary output LIBDIR path is $(LIBDIR)"
	@echo "Valid targets:"
	@echo "... all"
	@echo "... clean"
	@echo "... clobber"
	@printf "... %s\n" $(APPLICATIONS)
	@printf "... %s\n" $(LIBRARIES)
.PHONY: help
