# $NetBSD: buildlink2.mk,v 1.4 2003/07/26 21:41:22 jmmv Exp $

.if !defined(GUILIB_BUILDLINK2_MK)
GUILIB_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		GUIlib
BUILDLINK_DEPENDS.GUIlib?=	GUIlib>=1.1.0nb2
BUILDLINK_PKGSRCDIR.GUIlib?=	../../graphics/GUIlib

EVAL_PREFIX+=			BUILDLINK_PREFIX.GUIlib=GUIlib
BUILDLINK_PREFIX.GUIlib_DEFAULT=${LOCALBASE}
BUILDLINK_FILES.GUIlib=		include/GUI/*.h
BUILDLINK_FILES.GUIlib+=	lib/libGUI-*
BUILDLINK_FILES.GUIlib+=	lib/libGUI.*

.include "../../devel/SDL/buildlink2.mk"

BUILDLINK_TARGETS+=	GUIlib-buildlink

GUIlib-buildlink: _BUILDLINK_USE

.endif	# GUILIB_BUILDLINK2_MK
