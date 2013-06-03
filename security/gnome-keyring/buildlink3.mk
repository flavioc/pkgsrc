# $NetBSD: buildlink3.mk,v 1.31 2013/06/03 10:05:54 wiz Exp $

BUILDLINK_TREE+=	gnome-keyring

.if !defined(GNOME_KEYRING_BUILDLINK3_MK)
GNOME_KEYRING_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gnome-keyring+=	gnome-keyring>=0.4.0
BUILDLINK_ABI_DEPENDS.gnome-keyring+=	gnome-keyring>=2.32.1nb12
BUILDLINK_PKGSRCDIR.gnome-keyring?=	../../security/gnome-keyring

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../security/libtasn1/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.endif # GNOME_KEYRING_BUILDLINK3_MK

BUILDLINK_TREE+=	-gnome-keyring
