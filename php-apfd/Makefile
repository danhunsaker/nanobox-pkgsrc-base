# $NetBSD: Makefile,v 1.23 2013/03/17 10:46:45 taca Exp $
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

MODNAME=		apfd
PECL_VERSION=		${PHP_EXTENSION_VERSION.${MODNAME}}
CATEGORIES+=		devel

MAINTAINER=		pkgsrc-users@NetBSD.org
COMMENT=		apfd extension
LICENSE=		php

CONFLICTS=		php-apfd-[0-9]*

CONFIGURE_ARGS+=	--enable-${MODNAME}
WRKSRC=			${WRKDIR}/apfd-${PECL_VERSION}

.include "../../base/php/phpversion.mk"

.if ${_PHP_VERSION} == "70"
PKGREVISION=		1
.endif

.include "../../base/php/extension_versions.mk"
.include "../../base/php/ext.mk"
.include "../../mk/bsd.pkg.mk"