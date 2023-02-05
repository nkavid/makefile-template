library = logging

LOGGING_LIB = $(LIBDIR)/lib$(library).a
LOGGING_INCLUDE = -Isrc/logging

$(eval $(call make-static-library, $$(LOGGING_LIB), src/logging/logging.o))

