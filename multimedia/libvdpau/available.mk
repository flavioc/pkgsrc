# $NetBSD: available.mk,v 1.4 2017/01/22 10:58:47 maya Exp $

.include "../../mk/bsd.prefs.mk"

# At the moment VDPAU is available only for Linux, FreeBSD and
# [Open]Solaris.  The following condition is here to NOT list these
# platforms in multiple places, i.e. in mplayer, xine, xbmc etc.
# Have a look at buildlink3.mk too.

#.if ${OPSYS} == "Linux" && (${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "x86_64")
#VDPAU_AVAILABLE=	yes
#.elif ${OPSYS} == "FreeBSD" && (${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "x86_64")
#VDPAU_AVAILABLE=	yes
#.elif ${OPSYS} == "SunOS" && (${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "x86_64") \
#  && !empty(OS_VERSION:M5.1[0-9]*)
#VDPAU_AVAILABLE=	yes
#.else
#VDPAU_AVAILABLE=	no
#.endif

# XXX even these restrictions seem arbitrary
.if (${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "x86_64")
VDPAU_AVAILABLE=	yes
.endif
