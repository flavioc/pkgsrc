# $NetBSD: options.mk,v 1.3 2010/03/15 05:20:13 asau Exp $

PKG_OPTIONS_VAR=		PKG_OPTIONS.ecl
PKG_SUPPORTED_OPTIONS+=		threads unicode ffi clx
PKG_SUGGESTED_OPTIONS+=		# empty
# Unicode support proved to break Axioms.
# Threads are off, since threaded ECL requires threads support
# in Boehm GC (off by default).

.include "../../mk/bsd.options.mk"

PLIST_SRC=	PLIST	# default value

.if !empty(PKG_OPTIONS:Mthreads)
CONFIGURE_ARGS+=	--enable-threads --enable-debug
CONFIGURE_ENV+=		THREAD_CFLAGS=${PTHREAD_CFLAGS:Q}
CONFIGURE_ENV+=		THREAD_LDLAGS=${BUILDLINK_LDLAGS.pthread:Q}
CONFIGURE_ENV+=		THREAD_LIBS=${BUILDLINK_LIBS.pthread:Q}
.if ${OPSYS} == "FreeBSD" || ${OPSYS} == "Linux" || ${OPSYS} == "Darwin"
CONFIGURE_ARGS+=	--with-__thread=yes
.else
CONFIGURE_ARGS+=	--with-__thread=no
.endif
.include "../../mk/pthread.buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Municode)
CONFIGURE_ARGS+=	--enable-unicode
PLIST_SRC+=		PLIST.unicode
.endif

.if !empty(PKG_OPTIONS:Mffi)
.include "../../devel/libffi/buildlink3.mk"
.endif

.if !empty(PKG_OPTIONS:Mclx)
CONFIGURE_ARGS+=	--with-clx
.endif

PLIST_VARS+=		clx

.for option in clx
.  if !empty(PKG_OPTIONS:M${option})
PLIST.${option}=	yes
.  endif
.endfor
