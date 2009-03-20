# $NetBSD: buildlink3.mk,v 1.7 2009/03/20 19:25:10 joerg Exp $

BUILDLINK_TREE+=	mDNSResponder

.if !defined(MDNSRESPONDER_BUILDLINK3_MK)
MDNSRESPONDER_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.mDNSResponder+=	mDNSResponder>=98
BUILDLINK_ABI_DEPENDS.mDNSResponder?=	mDNSResponder>=107.5nb1
BUILDLINK_PKGSRCDIR.mDNSResponder?=	../../net/mDNSResponder
.endif # MDNSRESPONDER_BUILDLINK3_MK

BUILDLINK_TREE+=	-mDNSResponder
