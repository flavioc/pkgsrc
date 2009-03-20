# $NetBSD: buildlink3.mk,v 1.9 2009/03/20 19:24:32 joerg Exp $

BUILDLINK_TREE+=	DatLib

.if !defined(DATLIB_BUILDLINK3_MK)
DATLIB_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.DatLib+=	DatLib>=2.20
BUILDLINK_PKGSRCDIR.DatLib?=	../../emulators/DatLib
.endif # DATLIB_BUILDLINK3_MK

BUILDLINK_TREE+=	-DatLib
