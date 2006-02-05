# $NetBSD: buildlink3.mk,v 1.7 2006/02/05 23:09:47 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PNET_BUILDLINK3_MK:=	${PNET_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pnet
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npnet}
BUILDLINK_PACKAGES+=	pnet

.if !empty(PNET_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.pnet+=	pnet>=0.6.4
BUILDLINK_RECOMMENDED.pnet+=	pnet>=0.6.6nb2
BUILDLINK_PKGSRCDIR.pnet?=	../../lang/pnet
.endif	# PNET_BUILDLINK3_MK

.include "../../devel/zlib/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
