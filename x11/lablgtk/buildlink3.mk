# $NetBSD: buildlink3.mk,v 1.9 2007/09/21 13:00:53 wiz Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LABLGTK_BUILDLINK3_MK:=	${LABLGTK_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	lablgtk
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlablgtk}
BUILDLINK_PACKAGES+=	lablgtk
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}lablgtk

.if !empty(LABLGTK_BUILDLINK3_MK:M+)
BUILDLINK_API_DEPENDS.lablgtk+=	lablgtk>=2.6.0nb3
BUILDLINK_ABI_DEPENDS.lablgtk?=	lablgtk>=2.6.0nb5
BUILDLINK_PKGSRCDIR.lablgtk?=	../../x11/lablgtk
.endif	# LABLGTK_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
