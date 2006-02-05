# $NetBSD: buildlink3.mk,v 1.2 2006/02/05 23:09:43 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
CG_COMPILER_BUILDLINK3_MK:=	${CG_COMPILER_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	Cg-compiler
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:NCg-compiler}
BUILDLINK_PACKAGES+=	Cg-compiler

.if !empty(CG_COMPILER_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.Cg-compiler+=		Cg-compiler>=1.2.1
BUILDLINK_RECOMMENDED.Cg-compiler?=	Cg-compiler>=1.3beta2nb1
BUILDLINK_PKGSRCDIR.Cg-compiler?=	../../lang/Cg-compiler
.endif	# CG_COMPILER_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
