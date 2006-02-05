# $NetBSD: buildlink3.mk,v 1.5 2006/02/05 23:09:58 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SQUIRRELMAIL_BUILDLINK3_MK:=	${SQUIRRELMAIL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	squirrelmail
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsquirrelmail}
BUILDLINK_PACKAGES+=	squirrelmail

.if !empty(SQUIRRELMAIL_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.squirrelmail+=	{ja-,}squirrelmail>=1.4.5
BUILDLINK_RECOMMENDED.squirrelmail?=	squirrelmail>=1.4.5nb5
BUILDLINK_PKGSRCDIR.squirrelmail?=	../../mail/squirrelmail
.endif	# SQUIRRELMAIL_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
