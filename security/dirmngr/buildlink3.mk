# $NetBSD: buildlink3.mk,v 1.4 2006/02/05 23:10:43 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
DIRMNGR_BUILDLINK3_MK:=	${DIRMNGR_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	dirmngr
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ndirmngr}
BUILDLINK_PACKAGES+=	dirmngr

.if !empty(DIRMNGR_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.dirmngr+=	dirmngr>=0.9.3nb1
BUILDLINK_RECOMMENDED.dirmngr?=	dirmngr>=0.9.3nb2
BUILDLINK_PKGSRCDIR.dirmngr?=	../../security/dirmngr
.endif	# DIRMNGR_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
