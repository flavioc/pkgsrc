# $NetBSD: buildlink3.mk,v 1.1 2004/04/25 01:05:18 wiz Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
DRAC_BUILDLINK3_MK:=	${DRAC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	drac
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ndrac}
BUILDLINK_PACKAGES+=	drac

.if !empty(DRAC_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.drac+=	drac>=1.10
BUILDLINK_PKGSRCDIR.drac?=	../../mail/drac
.endif	# DRAC_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
