# Some rules for making a shared core dll on OS/2

os2core: httpd.dll $(CORE_IMPLIB)
	$(LIBTOOL) --mode=link gcc $(EXTRA_LDFLAGS) -o httpd $(CORE_IMPLIB)

httpd.dll: $(PROGRAM_DEPENDENCIES) $(CORE_IMPLIB)
	$(LINK) -Zdll $(EXTRA_LDFLAGS) -s -o $@ server/exports.lo modules.lo $(PROGRAM_DEPENDENCIES) $(EXTRA_LIBS) server/ApacheCoreOS2.def
