# $NetBSD: options.mk,v 1.12 2013/07/04 19:31:15 wiz Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.subversion
PKG_SUPPORTED_OPTIONS=	apr1 serf sasl
.include "../../mk/bsd.prefs.mk"
.if !defined(PKG_APACHE_DEFAULT) || empty(PKG_APACHE_DEFAULT:Mapache2)
PKG_SUGGESTED_OPTIONS=	apr1
.endif
PKG_SUGGESTED_OPTIONS+=	serf

# Note that this file is included as part of several packages.
# Therefore this file defines options and includes some but not all of
# the typical fragments, leaving some to individual package files.

.include "../../mk/bsd.options.mk"

PLIST_VARS+=	serf

.if !empty(PKG_OPTIONS:Mserf)
DAV_RA=		serf
PLIST.serf=	yes
BUILDLINK_ABI_DEPENDS.serf+=    serf>=1.2.1
.  include "../../base/serf/buildlink3.mk"
CONFIGURE_ARGS+=	--with-serf=${BUILDLINK_PREFIX.serf}
.endif

.if !empty(PKG_OPTIONS:Msasl)
.include "../../security/cyrus-sasl/buildlink3.mk"
CONFIGURE_ARGS+=	--with-sasl=${BUILDLINK_PREFIX.cyrus-sasl}
.else
CONFIGURE_ARGS+=	--without-sasl
.endif
