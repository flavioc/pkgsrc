# $NetBSD: buildlink3.mk,v 1.6 2006/02/05 23:09:31 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GLITZ_BUILDLINK3_MK:=	${GLITZ_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	glitz
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nglitz}
BUILDLINK_PACKAGES+=	glitz

.if !empty(GLITZ_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.glitz+=	glitz>=0.4.4
BUILDLINK_RECOMMENDED.glitz+=	glitz>=0.4.4nb2
BUILDLINK_PKGSRCDIR.glitz?=	../../graphics/glitz
.endif	# GLITZ_BUILDLINK3_MK

.include "../../graphics/MesaLib/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
