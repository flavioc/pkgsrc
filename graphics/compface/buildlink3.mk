# $NetBSD: buildlink3.mk,v 1.8 2009/03/20 19:24:37 joerg Exp $

BUILDLINK_TREE+=	compface

.if !defined(COMPFACE_BUILDLINK3_MK)
COMPFACE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.compface+=	compface>=1.4
BUILDLINK_ABI_DEPENDS.compface?=	compface>=1.5.1nb1
BUILDLINK_PKGSRCDIR.compface?=	../../graphics/compface
.endif # COMPFACE_BUILDLINK3_MK

BUILDLINK_TREE+=	-compface
