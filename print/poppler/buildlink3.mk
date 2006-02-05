# $NetBSD: buildlink3.mk,v 1.4 2006/02/05 23:10:38 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
POPPLER_BUILDLINK3_MK:=	${POPPLER_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	poppler
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npoppler}
BUILDLINK_PACKAGES+=	poppler

.if !empty(POPPLER_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.poppler+=	poppler>=0.4.1
BUILDLINK_RECOMMENDED.poppler+=	poppler>=0.4.4nb2
BUILDLINK_PKGSRCDIR.poppler?=	../../print/poppler
.endif	# POPPLER_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
