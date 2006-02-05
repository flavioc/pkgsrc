# $NetBSD: buildlink3.mk,v 1.2 2006/02/05 23:08:50 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
PCCTS_BUILDLINK3_MK:=	${PCCTS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	pccts
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Npccts}
BUILDLINK_PACKAGES+=	pccts

.if !empty(PCCTS_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.pccts+=	pccts>=1.33.22
BUILDLINK_RECOMMENDED.pccts?=	pccts>=1.33.22nb1
BUILDLINK_PKGSRCDIR.pccts?=	../../devel/pccts
BUILDLINK_DEPMETHOD.pccts?=	build
.endif	# PCCTS_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
