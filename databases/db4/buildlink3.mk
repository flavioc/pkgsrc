# $NetBSD: buildlink3.mk,v 1.22 2004/11/17 18:29:20 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
DB4_BUILDLINK3_MK:=	${DB4_BUILDLINK3_MK}+

.include "../../mk/bsd.prefs.mk"

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	db4
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ndb4}
BUILDLINK_PACKAGES+=	db4

.if !empty(DB4_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.db4+=		db4>=4.2.52
BUILDLINK_RECOMMENDED.db4+=	db4>=4.2.52nb7
BUILDLINK_PKGSRCDIR.db4?=	../../databases/db4
BUILDLINK_INCDIRS.db4?=		include/db4
BUILDLINK_LDADD.db4=		-ldb4
BUILDLINK_TRANSFORM+=		l:db-4:db4

.  if defined(USE_DB185) && !empty(USE_DB185:M[yY][eE][sS])
#
# Older db4 packages didn't enable the db-1.85 compatibility API.
#
BUILDLINK_DEPENDS.db4+=		db4>=4.2.52nb1
BUILDLINK_LIBS.db4=		${BUILDLINK_LDADD.db4}
BUILDLINK_TRANSFORM+=		l:db:db4
.  endif
.endif	# DB4_BUILDLINK3_MK

.include "../../mk/pthread.buildlink3.mk"

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
