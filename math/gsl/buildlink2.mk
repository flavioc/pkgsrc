# $NetBSD: buildlink2.mk,v 1.5 2003/08/30 21:51:00 jtb Exp $

.if !defined(GSL_BUILDLINK2_MK)
GSL_BUILDLINK2_MK=              # defined

BUILDLINK_PACKAGES+=		gsl
BUILDLINK_DEPENDS.gsl?=		gsl>=1.4
BUILDLINK_PKGSRCDIR.gsl?=	../../math/gsl
BUILDLINK_DEPMETHOD.gsl?=	build

EVAL_PREFIX+=			BUILDLINK_PREFIX.gsl=gsl
BUILDLINK_PREFIX.gsl_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.gsl=		include/gsl/*
BUILDLINK_FILES.gsl+=		lib/libgsl.*
BUILDLINK_FILES.gsl+=		lib/libgslcblas.*

BUILDLINK_TARGETS+=	gsl-buildlink

gsl-buildlink: _BUILDLINK_USE

.endif # GSL_BUILDLINK2_MK
