# $NetBSD: buildlink3.mk,v 1.2 2006/02/05 23:08:32 joerg Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
LIBPQXX_BUILDLINK3_MK:=	${LIBPQXX_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	libpqxx
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nlibpqxx}
BUILDLINK_PACKAGES+=	libpqxx

.if !empty(LIBPQXX_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.libpqxx+=	libpqxx>=2.5.0
BUILDLINK_RECOMMENDED.libpqxx?=	libpqxx>=2.5.4nb1
BUILDLINK_PKGSRCDIR.libpqxx?=	../../databases/libpqxx
.endif	# LIBPQXX_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
