src/app/c_main.o:
	$(CC) $(CFLAGS) $(LOGGING_INCLUDE) -c -o $@ src/app/c_main.c

$(eval $(call make-c-application, c-app, src/app/c_main.o, $$(LOGGING_LIB)))

$(eval $(call make-cxx-application, cxx-app, src/app/cxx_main.o))
