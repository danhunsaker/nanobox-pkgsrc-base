# $NetBSD$
# -*- mode: makefile; tab-width: 8; indent-tabs-mode: 1 -*-
# vim: ts=8 sw=8 ft=make noet

DISTNAME=	release_${VERSION}
PKGNAME=	${DISTNAME:S/release_/galera-/}
VERSION=	25.3.17
CATEGORIES=	databases
MASTER_SITES=	https://github.com/codership/galera/archive/

# git@github.com:codership/galera.git
# https://github.com/codership/galera/archive/release_25.3.10.zip

MAINTAINER=	braxton@pagodabox.com
HOMEPAGE=	http://galeracluster.com/
COMMENT=	Galera Cluster for MySQL
# LICENSE=	modified-bsd

BUILD_DEPENDS+=	scons-[0-9]*:../../devel/scons

USE_LANGUAGES=	c c++

INSTALLATION_DIRS+=		lib/mysql/plugin bin

MAKE_ENV+=	CPPFLAGS=-I${PREFIX}/include
MAKE_ENV+=	LIBPATH=${PREFIX}/lib
MAKE_ENV+=	RPATH=${PREFIX}/lib
LDFLAGS+=	${COMPILER_RPATH_FLAG}${PREFIX}/lib

WRKSRC=		${WRKDIR}/galera-${DISTNAME}

do-build:
	cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} scons strict_build_flags=0 tests=0 -j 8

do-install:
	${INSTALL_LIB} ${WRKSRC}/libgalera_smm.so ${DESTDIR}${PREFIX}/lib/mysql/plugin/
	${INSTALL_PROGRAM} ${WRKSRC}/garb/garbd ${DESTDIR}${PREFIX}/bin

.include "../../devel/boost-build/buildlink3.mk"
.include "../../devel/boost-headers/buildlink3.mk"
.include "../../devel/boost-libs/buildlink3.mk"
.include "../../devel/check/buildlink3.mk"
.include "../../security/openssl/buildlink3.mk"
# .include "../../mk/mysql.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.prefs.mk"
.include "../../mk/bsd.pkg.mk"
