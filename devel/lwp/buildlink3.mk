# $NetBSD: buildlink3.mk,v 1.7 2009/03/20 19:24:24 joerg Exp $

BUILDLINK_TREE+=	lwp

.if !defined(LWP_BUILDLINK3_MK)
LWP_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.lwp+=	lwp>=1.6
BUILDLINK_ABI_DEPENDS.lwp+=	lwp>=1.10nb1
BUILDLINK_PKGSRCDIR.lwp?=	../../devel/lwp
.endif # LWP_BUILDLINK3_MK

BUILDLINK_TREE+=	-lwp
