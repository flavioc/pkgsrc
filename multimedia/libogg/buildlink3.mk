# $NetBSD: buildlink3.mk,v 1.1.1.1 2004/04/12 23:03:03 salo Exp $
#

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBOGG_BUILDLINK3_MK:=	${LIBOGG_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libogg
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibogg}
BUILDLINK_PACKAGES+=	libogg

.if !empty(LIBOGG_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libogg+=	libogg>=1.1
BUILDLINK_PKGSRCDIR.libogg?=	../../multimedia/libogg
.endif	# LIBOGG_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
