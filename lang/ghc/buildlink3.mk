# $NetBSD: buildlink3.mk,v 1.2 2006/02/05 23:09:45 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GHC_BUILDLINK3_MK:=	${GHC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ghc
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nghc}
BUILDLINK_PACKAGES+=	ghc

.if !empty(GHC_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.ghc+=		ghc>=6.2.1nb1
BUILDLINK_RECOMMENDED.ghc?=	ghc>=6.4.1nb1
BUILDLINK_PKGSRCDIR.ghc?=	../../lang/ghc

BUILDLINK_DEPMETHOD.ghc?=	build
.endif	# GHC_BUILDLINK3_MK

.include "../../devel/gmp/buildlink3.mk"
.include "../../devel/readline/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
