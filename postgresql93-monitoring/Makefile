# $NetBSD: Makefile,v 1.5 2014/03/27 20:57:55 adam Exp $

PKGNAME=	${DISTNAME:C/-/93-monitoring-/}
COMMENT=	PostgreSQL monitoring tools

DEPENDS+=	postgresql93-server>=${PKGVERSION_NOREV}:../../base/postgresql93-server

.include "../../base/postgresql93/Makefile.common"

BUILD_MAKE_FLAGS=	PGXS=1

BUILD_DIRS+=		contrib/auto_explain
BUILD_DIRS+=		contrib/pg_buffercache
BUILD_DIRS+=		contrib/pg_stat_statements
BUILD_DIRS+=		contrib/pg_test_timing
BUILD_DIRS+=		contrib/pgstattuple

.include "../../base/postgresql93-client/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
