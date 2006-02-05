# $NetBSD: buildlink3.mk,v 1.3 2006/02/05 23:09:42 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
HAMLIB_BUILDLINK3_MK:=	${HAMLIB_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	hamlib
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nhamlib}
BUILDLINK_PACKAGES+=	hamlib

.if !empty(HAMLIB_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.hamlib+=	hamlib>=1.1.4
BUILDLINK_RECOMMENDED.hamlib+=	hamlib>=1.2.4nb1
BUILDLINK_PKGSRCDIR.hamlib?=	../../ham/hamlib
.endif	# HAMLIB_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
