# $NetBSD: buildlink3.mk,v 1.1 2004/04/28 00:28:18 snj Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LUA4_BUILDLINK3_MK:=	${LUA4_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	lua4
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlua4}
BUILDLINK_PACKAGES+=	lua4

.if !empty(LUA4_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.lua4+=	lua4>=4.0.1
BUILDLINK_PKGSRCDIR.lua4?=	../../lang/lua4
.endif	# LUA4_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
