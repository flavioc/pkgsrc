# $NetBSD: buildlink2.mk,v 1.4 2003/09/05 18:50:33 jmmv Exp $

.if !defined(BUILDTOOL_BUILDLINK2_MK)
BUILDTOOL_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		buildtool
BUILDLINK_DEPENDS.buildtool?=	buildtool>=0.14
BUILDLINK_PKGSRCDIR.buildtool?=	../../devel/buildtool
BUILDLINK_DEPMETHOD.buildtool?=	build

EVAL_PREFIX+=	BUILDLINK_PREFIX.buildtool=buildtool
BUILDLINK_PREFIX.buildtool_DEFAULT=	${LOCALBASE}

BUILDTOOL=		${BUILDLINK_PREFIX.buildtool}/bin/buildtool

BUILD_TARGET=		all
INSTALL_TARGET=		install

HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	${BUILDTOOL} config
CONFIGURE_ENV+=		BT_FLAGS_CC="${CFLAGS}"
CONFIGURE_ENV+=		BT_FLAGS_CPP="${CPPFLAGS}"
CONFIGURE_ENV+=		BT_FLAGS_CXX="${CXXFLAGS}"
CONFIGURE_ENV+=		BT_FLAGS_LD="${LDFLAGS}"
CONFIGURE_ENV+=		BT_PROG_AWK="${AWK}"
CONFIGURE_ENV+=		BT_PROG_CC="${CC}"
CONFIGURE_ENV+=		BT_PROG_CXX="${CXX}"
CONFIGURE_ENV+=		BT_PROG_LD="${LD}"
CONFIGURE_ENV+=		BT_PROG_M4="${M4}"
CONFIGURE_ARGS+=	--prefix=${PREFIX}

.if !target(do-build)
do-build:
	${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${BUILDTOOL} build
.endif

.if !target(do-install)
do-install:
	${_PKG_SILENT}${_PKG_DEBUG}${_ULIMIT_CMD}cd ${WRKSRC} && ${SETENV} ${MAKE_ENV} ${BUILDTOOL} install
.endif

.endif	# BUILDTOOL_BUILDLINK2_MK
