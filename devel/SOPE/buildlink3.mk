# $NetBSD: buildlink3.mk,v 1.2 2014/03/13 14:02:44 taca Exp $

BUILDLINK_TREE+=	SOPE

.if !defined(SOPE_BUILDLINK3_MK)
SOPE_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.SOPE+=	SOPE>=2.1.1
BUILDLINK_ABI_DEPENDS.SOPE+=	SOPE>=2.1.1
BUILDLINK_PKGSRCDIR.SOPE?=	../../devel/SOPE
.endif # SOPE_BUILDLINK3_MK

BUILDLINK_TREE+=	-SOPE
