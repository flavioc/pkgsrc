# $NetBSD: buildlink3.mk,v 1.7 2012/02/06 12:41:03 wiz Exp $

BUILDLINK_TREE+=	gst-plugins0.10-bad

.if !defined(GST_PLUGINS0.10_BAD_BUILDLINK3_MK)
GST_PLUGINS0.10_BAD_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.gst-plugins0.10-bad+=	gst-plugins0.10-bad>=0.10.3
BUILDLINK_ABI_DEPENDS.gst-plugins0.10-bad?=	gst-plugins0.10-bad>=0.10.22nb3
BUILDLINK_PKGSRCDIR.gst-plugins0.10-bad?= ../../multimedia/gst-plugins0.10-bad

.include "../../multimedia/gstreamer0.10/buildlink3.mk"
.include "../../multimedia/gst-plugins0.10-base/buildlink3.mk"
.endif # GST_PLUGINS0.10_BAD_BUILDLINK3_MK

BUILDLINK_TREE+=	-gst-plugins0.10-bad
