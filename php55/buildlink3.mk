# $NetBSD: buildlink3.mk,v 1.1 2012/06/16 05:21:55 taca Exp $

BUILDLINK_TREE+=	php

.if !defined(PHP_BUILDLINK3_MK)
PHP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.php+=	php>=5.5.2<5.6
BUILDLINK_ABI_DEPENDS.php+=	php>=5.5.2<5.6
BUILDLINK_PKGSRCDIR.php?=	../../base/php55

.include "../../textproc/libxml2/buildlink3.mk"
.endif # PHP_BUILDLINK3_MK

BUILDLINK_TREE+=	-php
