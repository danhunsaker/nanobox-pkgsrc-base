$NetBSD$

Build with newer DTrace.

--- cmake/plugin.cmake.orig	2015-02-25 15:40:53.000000000 +0000
+++ cmake/plugin.cmake
@@ -21,6 +21,7 @@ INCLUDE(${MYSQL_CMAKE_SCRIPT_DIR}/cmake_
 # [STORAGE_ENGINE]
 # [MANDATORY|DEFAULT]
 # [STATIC_ONLY|DYNAMIC_ONLY]
+# [DTRACE_INSTRUMENTED]
 # [MODULE_OUTPUT_NAME module_name]
 # [STATIC_OUTPUT_NAME static_name]
 # [RECOMPILE_FOR_EMBEDDED]
@@ -30,7 +31,7 @@ INCLUDE(${MYSQL_CMAKE_SCRIPT_DIR}/cmake_
 MACRO(MYSQL_ADD_PLUGIN)
   MYSQL_PARSE_ARGUMENTS(ARG
     "LINK_LIBRARIES;DEPENDENCIES;MODULE_OUTPUT_NAME;STATIC_OUTPUT_NAME;COMPONENT;CONFIG"
-    "STORAGE_ENGINE;STATIC_ONLY;MODULE_ONLY;MANDATORY;DEFAULT;DISABLED;RECOMPILE_FOR_EMBEDDED"
+    "STORAGE_ENGINE;STATIC_ONLY;MODULE_ONLY;MANDATORY;DEFAULT;DISABLED;RECOMPILE_FOR_EMBEDDED;DTRACE_INSTRUMENTED"
     ${ARGN}
   )
   
@@ -118,7 +119,9 @@ MACRO(MYSQL_ADD_PLUGIN)
     ENDIF()
 
     ADD_LIBRARY(${target} STATIC ${SOURCES})
-    DTRACE_INSTRUMENT(${target})
+    IF (ARG_DTRACE_INSTRUMENTED)
+      DTRACE_INSTRUMENT(${target})
+    ENDIF()
     ADD_DEPENDENCIES(${target} GenError ${ARG_DEPENDENCIES})
     RESTRICT_SYMBOL_EXPORTS(${target})
     IF(WITH_EMBEDDED_SERVER)
@@ -128,7 +131,9 @@ MACRO(MYSQL_ADD_PLUGIN)
         # Recompile some plugins for embedded
         ADD_CONVENIENCE_LIBRARY(${target}_embedded ${SOURCES})
         RESTRICT_SYMBOL_EXPORTS(${target}_embedded)
-        DTRACE_INSTRUMENT(${target}_embedded)   
+        IF (ARG_DTRACE_INSTRUMENTED)
+          DTRACE_INSTRUMENT(${target}_embedded)   
+        ENDIF()
         IF(ARG_RECOMPILE_FOR_EMBEDDED)
           SET_TARGET_PROPERTIES(${target}_embedded 
             PROPERTIES COMPILE_DEFINITIONS "EMBEDDED_LIBRARY")
@@ -167,7 +172,9 @@ MACRO(MYSQL_ADD_PLUGIN)
   
     ADD_VERSION_INFO(${target} MODULE SOURCES)
     ADD_LIBRARY(${target} MODULE ${SOURCES}) 
-    DTRACE_INSTRUMENT(${target})
+    IF (ARG_DTRACE_INSTRUMENTED)
+      DTRACE_INSTRUMENT(${target})
+    ENDIF()
     SET_TARGET_PROPERTIES (${target} PROPERTIES PREFIX ""
       COMPILE_DEFINITIONS "MYSQL_DYNAMIC_PLUGIN")
     TARGET_LINK_LIBRARIES (${target} mysqlservices)
