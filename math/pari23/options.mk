# $NetBSD: options.mk,v 1.5 2024/07/24 09:33:29 jperkin Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.pari
PKG_SUPPORTED_OPTIONS=	doc gmp x11
# x11 is not suggested because it's not reasonable to include a GUI in
# a foundation library.
PKG_SUGGESTED_OPTIONS=	gmp

.include "../../mk/bsd.prefs.mk"

# pdftex is highly unreliable
.if ${OPSYS} != "SunOS"
PKG_SUGGESTED_OPTIONS+=	doc
.endif

.include "../../mk/bsd.options.mk"

PLIST_VARS+=		doc
.if !empty(PKG_OPTIONS:Mdoc)
TOOL_DEPENDS+=		tex-amsfonts>=3.0:../../fonts/tex-amsfonts
TOOL_DEPENDS+=		tex-hyphen-german-[0-9]*:../../print/tex-hyphen-german
TOOL_DEPENDS+=		tex-hyphen-russian-[0-9]*:../../print/tex-hyphen-russian
TOOL_DEPENDS+=		tex-pdftex>=1.40.11:../../print/tex-pdftex
PLIST.doc=		yes
BUILD_TARGET+=		doc
INSTALL_TARGET+=	install-doc
MAKE_ENV+=		PDFTEX=${PREFIX}/bin/pdftex
.endif

PLIST_VARS+=		nogmp gmp
.if !empty(PKG_OPTIONS:Mgmp)
PLIST.gmp=		yes
CONFIGURE_ARGS+=	--with-gmp=${BUILDLINK_PREFIX.gmp}
.include "../../devel/gmp/buildlink3.mk"
.else
PLIST.nogmp=		yes
CONFIGURE_ARGS+=	--without-gmp
.endif

.if !empty(PKG_OPTIONS:Mx11)
USE_TOOLS+=		imake
CONFIGURE_ARGS+=	--graphic=X11
CONFIGURE_ARGS+=	--with-fltk=${BUILDLINK_PREFIX.fltk}
CONFIGURE_ENV+=		X11BASE=${X11BASE}
CONFIGURE_ENV+=		Xincroot=${X11BASE}/include
.include "../../x11/libX11/buildlink3.mk"
.include "../../x11/libXft/buildlink3.mk"
.include "../../x11/libXrender/buildlink3.mk"
.include "../../x11/fltk13/buildlink3.mk"
.else
CONFIGURE_ARGS+=	--graphic=none
# don't let the configure script find an installed fltk
CONFIGURE_ARGS+=	--with-fltk=${BUILDLINK_DIR:Q}/nonexistent
.endif
