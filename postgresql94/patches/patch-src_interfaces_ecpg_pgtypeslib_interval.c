$NetBSD$

--- src/interfaces/ecpg/pgtypeslib/interval.c.orig	2016-05-09 20:52:03.000000000 +0000
+++ src/interfaces/ecpg/pgtypeslib/interval.c
@@ -14,6 +14,10 @@
 #include "pgtypes_error.h"
 #include "pgtypes_interval.h"
 
+#if defined(__NetBSD__)
+#define strtoi pg_strtoi
+#endif
+
 /* copy&pasted from .../src/backend/utils/adt/datetime.c */
 static int
 strtoint(const char *nptr, char **endptr, int base)
