# $NetBSD: bdb.buildlink3.mk,v 1.1 2004/03/10 18:06:06 jlam Exp $
#
# This Makefile fragment is meant to be included by packages that
# require a Berkeley DB implementation.  db.buildlink3.mk will:
#
#       * set BDBBASE to the base directory of the Berkeley DB files;
#       * set BDB_TYPE to the Berkeley DB implementation used.
#
# There are two variables that can be used to tweak the selection of
# the Berkeley DB implementation:
#
# BDB_DEFAULT is a user-settable variable whose value is the default
#       Berkeley DB implementation to use.
#
# BDB_ACCEPTED is a package-settable list of Berkeley DB implementations
#       that may be used by the package.

BDB_BUILDLINK3_MK:=	${BDB_BUILDLINK3_MK}+

.include "../../mk/bsd.prefs.mk"

.if !empty(BDB_BUILDLINK3_MK)
BDB_DEFAULT?=	# empty
BDB_ACCEPTED?=	${_BDB_PKGS}

# This is an exhaustive list of all of the Berkeley DB implementations
# that may be used with bdb.buildlink3.mk, in order of precedence.
#
_BDB_PKGS?=	native db4 db3 db2

_BDB_PKGBASE.db2=	db
.  for _bdb_ in ${_BDB_PKGS}
_BDB_PKGBASE.${_bdb_}?=	${_bdb_}
.  endfor

_BDB_DEFAULT=	${BDB_DEFAULT}
_BDB_ACCEPTED=	${BDB_ACCEPTED}

# Mark the acceptable Berkeley DB packages and check which, if any, are
# already installed.
#
.  for _bdb_ in ${_BDB_ACCEPTED:Nnative}
_BDB_OK.${_bdb_}=	yes
.    if !defined(_BDB_INSTALLED.${_bdb_})
_BDB_INSTALLED.${_bdb_}!=	\
	if ${PKG_INFO} -qe ${_bdb_}; then				\
		${ECHO} "yes";						\
	else								\
		${ECHO} "no";						\
	fi
MAKEFLAGS+=	_BDB_INSTALLED.${_bdb_}=${_BDB_INSTALLED.${_bdb_}}
.    endif
.  endfor

_BDB_OK.native?=	no
_BDB_INSTALLED.native?=	no
.  if defined(USE_DB185)
.    if exists(/usr/include/db.h)
_BDB_OK.native=		yes
_BDB_INSTALLED.native=	yes
_BDB_INCDIRS=		include
_BDB_TRANSFORM=		# empty
.    elif exists(/usr/include/db1/db.h)
_BDB_OK.native=		yes
_BDB_INSTALLED.native=	yes
_BDB_INCDIRS=		include/db1
_BDB_TRANSFORM=		l:db:db1
.    endif
.  endif

.  if !defined(_BDB)
#
# Prefer the default one if it's accepted,...
#
.    if !empty(_BDB_DEFAULT) && \
	defined(_BDB_OK.${_BDB_DEFAULT}) && \
	!empty(_BDB_OK.${_BDB_DEFAULT}:M[yY][eE][sS])
_BDB=		${_BDB_DEFAULT}
.    endif
#
# ...otherwise, use one of the installed Berkeley DB packages,...
#
.    for _bdb_ in ${_BDB_ACCEPTED}
.      if !empty(_BDB_INSTALLED.${_bdb_}:M[yY][eE][sS])
_BDB?=		${_bdb_}
.      else
_BDB_FIRSTACCEPTED?=	${_bdb_}
.      endif
.    endfor
#
# ...otherwise, just use the first accepted Berkeley DB package.
#
.    if defined(_BDB_FIRSTACCEPTED)
_BDB?=		${_BDB_FIRSTACCEPTED}
.    endif
_BDB?=		none
MAKEFLAGS+=	_BDB=${_BDB}
.  endif

BDB_TYPE=	${_BDB}
BUILD_DEFS+=	BDB_TYPE

.  if ${BDB_TYPE} == "none"
PKG_FAIL_REASON=	"No acceptable Berkeley DB implementation found."
.  else
.    if ${BDB_TYPE} == "native"
IS_BUILTIN.db-native=		yes
USE_BUILTIN.db-native=		yes
BUILDLINK_PACKAGES:=		${BUILDLINK_PACKAGES:Ndb-native}
BUILDLINK_PACKAGES+=		db-native
BUILDLINK_INCDIRS.db-native?=	${_BDB_INCDIRS}
BUILDLINK_TRANSFORM?=		${_BDB_TRANSFORM}
BDBBASE=	${BUILDLINK_PREFIX.db-native}
.      include "../../databases/db4/buildlink3.mk"
.    elif ${BDB_TYPE} == "db4"
BDBBASE=	${BUILDLINK_PREFIX.db4}
.      include "../../databases/db4/buildlink3.mk"
.    elif ${BDB_TYPE} == "db3"
BDBBASE=	${BUILDLINK_PREFIX.db3}
.      include "../../databases/db3/buildlink3.mk"
.    elif ${BDB_TYPE} == "db"
BDBBASE=	${BUILDLINK_PREFIX.db2}
.      include "../../databases/db/buildlink3.mk"
.    endif
.  endif
BUILD_DEFS+=	BDBBASE

.endif	# BDB_BUILDLINK3_MK
