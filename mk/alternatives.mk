# $NetBSD: alternatives.mk,v 1.8 2006/11/10 20:48:41 rillig Exp $
#
# This Makefile fragment handles the alternatives system, registering a
# package in the database.
#
# User-settable variables:
#
# (none)
#
# Package-settable variables:
#
# ALTERNATIVES_SRC
#	A _single_ file that contains the alternatives provided by the
#	package.
#
#	Default value: The name of the ALTERNATIVES file in the package
#	directory, if it exists. Otherwise, nothing.
#
# Variables defined by this file:
#
# PKG_ALTERNATIVES
#	The path to the pkg_alternatives command.
#

.if !defined(ALTERNATIVES_MK)
ALTERNATIVES_MK=	# defined

.if exists(${.CURDIR}/ALTERNATIVES)
ALTERNATIVES_SRC?=	${.CURDIR}/ALTERNATIVES
.endif
ALTERNATIVES_SRC?=	# none

.if !empty(ALTERNATIVES_SRC)

${WRKDIR}/.altinstall: ${ALTERNATIVES_SRC}
	@{ ${ECHO} 'if ${TEST} $${STAGE} = "POST-INSTALL"; then'; \
	${ECHO} '${CAT} >./+ALTERNATIVES <<EOF'; \
	${SED} ${FILES_SUBST_SED} <${ALTERNATIVES_SRC}; \
	${ECHO} 'EOF'; \
	${ECHO} 'if ${TEST} -x ${PKG_ALTERNATIVES}; then'; \
	${ECHO} '${PKG_ALTERNATIVES} -gs register ./+ALTERNATIVES'; \
	${ECHO} 'fi'; \
	${ECHO} 'fi'; \
	} >${WRKDIR}/.altinstall

${WRKDIR}/.altdeinstall: ${ALTERNATIVES_SRC}
	@{ ${ECHO} 'if ${TEST} $${STAGE} = "DEINSTALL"; then'; \
	${ECHO} 'if ${TEST} -x ${PKG_ALTERNATIVES}; then'; \
	${ECHO} '${PKG_ALTERNATIVES} -gs unregister ./+ALTERNATIVES'; \
	${ECHO} 'fi'; \
	${ECHO} '${RM} -f ./+ALTERNATIVES'; \
	${ECHO} 'fi'; \
	} >${WRKDIR}/.altdeinstall

PRINT_PLIST_AWK+=	/^libdata\/alternatives\// { next; }
PRINT_PLIST_AWK+=	/^@dirrm libdata\/alternatives/ { next; }

EVAL_PREFIX+=			PREFIX.pkg_alternatives=pkg_alternatives
PREFIX.alternatives_DEFAULT=	${LOCALBASE}
PKG_ALTERNATIVES=		${PREFIX.pkg_alternatives}/sbin/pkg_alternatives

INSTALL_TEMPLATES+=	${WRKDIR}/.altinstall
DEINSTALL_TEMPLATES+=	${WRKDIR}/.altdeinstall

.endif

.endif	# ALTERNATIVES_MK
