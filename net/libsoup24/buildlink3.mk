# $NetBSD: buildlink3.mk,v 1.4 2009/03/20 19:25:10 joerg Exp $

BUILDLINK_TREE+=	libsoup24

.if !defined(LIBSOUP24_BUILDLINK3_MK)
LIBSOUP24_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libsoup24+=	libsoup24>=2.4.0
BUILDLINK_ABI_DEPENDS.libsoup24?=	libsoup24>=2.4.0
BUILDLINK_PKGSRCDIR.libsoup24?=		../../net/libsoup24

.include "../../databases/sqlite3/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../security/gnutls/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../www/libproxy/buildlink3.mk"
.endif # LIBSOUP24_BUILDLINK3_MK

BUILDLINK_TREE+=	-libsoup24
