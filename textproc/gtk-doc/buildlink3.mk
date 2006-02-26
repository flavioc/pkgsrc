# $NetBSD: buildlink3.mk,v 1.1 2006/02/26 10:24:35 wiz Exp $

# provided mostly for pkg-config

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
GTK_DOC_BUILDLINK3_MK:=	${GTK_DOC_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	gtk-doc
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngtk-doc}
BUILDLINK_PACKAGES+=	gtk-doc

.if !empty(GTK_DOC_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.gtk-doc+=	gtk-doc>=1.4nb1
BUILDLINK_PKGSRCDIR.gtk-doc?=	../../textproc/gtk-doc
.endif	# GTK_DOC_BUILDLINK3_MK

BUILDLINK_DEPMETHOD.gtk-doc?=	build

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
