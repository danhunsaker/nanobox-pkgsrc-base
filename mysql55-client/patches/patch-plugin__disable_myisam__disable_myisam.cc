$NetBSD$

--- plugin/disable_myisam/disable_myisam.cc.orig	2015-04-24 19:37:29.688193980 +0000
+++ plugin/disable_myisam/disable_myisam.cc
@@ -13,6 +13,7 @@
    along with this program; if not, write to the Free Software
    Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA */
 
+#define MYSQL_SERVER 1
 #include <mysql_version.h>
 #include <mysql/plugin.h>
 
