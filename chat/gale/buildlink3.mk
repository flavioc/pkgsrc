# $NetBSD: buildlink3.mk,v 1.2 2006/02/05 23:08:24 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GALE_BUILDLINK3_MK:=	${GALE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gale
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngale}
BUILDLINK_PACKAGES+=	gale

.if !empty(GALE_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.gale+=	gale>=0.99f
BUILDLINK_RECOMMENDED.gale?=	gale>=0.99fnb1
BUILDLINK_PKGSRCDIR.gale?=	../../chat/gale
.endif	# GALE_BUILDLINK3_MK

.include "../../devel/boehm-gc/buildlink3.mk"
.include "../../devel/glib/buildlink3.mk"
.include "../../devel/readline/buildlink3.mk"
.include "../../lang/tcl/buildlink3.mk"
.include "../../net/adns/buildlink3.mk"
.include "../../security/rsaref/buildlink3.mk"
.include "../../www/libwww/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
