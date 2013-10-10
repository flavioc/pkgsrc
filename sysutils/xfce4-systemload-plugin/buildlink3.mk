# $NetBSD: buildlink3.mk,v 1.38 2013/10/10 14:41:56 ryoon Exp $

BUILDLINK_TREE+=	xfce4-systemload-plugin

.if !defined(XFCE4_SYSTEMLOAD_PLUGIN_BUILDLINK3_MK)
XFCE4_SYSTEMLOAD_PLUGIN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-systemload-plugin+=	xfce4-systemload-plugin>=0.4.2
BUILDLINK_ABI_DEPENDS.xfce4-systemload-plugin+=	xfce4-systemload-plugin>=0.4.2nb20
BUILDLINK_PKGSRCDIR.xfce4-systemload-plugin?=	../../sysutils/xfce4-systemload-plugin

.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.endif # XFCE4_SYSTEMLOAD_PLUGIN_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-systemload-plugin
