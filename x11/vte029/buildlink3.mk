# $NetBSD: buildlink3.mk,v 1.15 2017/02/06 13:54:59 wiz Exp $

BUILDLINK_TREE+=	vte029

.if !defined(VTE029_BUILDLINK3_MK)
VTE029_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.vte029+=	vte029>=0.32.2
BUILDLINK_ABI_DEPENDS.vte029+=	vte029>=0.32.2nb15
BUILDLINK_PKGSRCDIR.vte029?=	../../x11/vte029

.include "../../devel/glib2/buildlink3.mk"
.include "../../devel/pango/buildlink3.mk"
.include "../../x11/gtk3/buildlink3.mk"
.include "../../mk/termcap.buildlink3.mk"
.endif # VTE029_BUILDLINK3_MK

BUILDLINK_TREE+=	-vte029
