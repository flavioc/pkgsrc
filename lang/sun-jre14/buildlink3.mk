# $NetBSD: buildlink3.mk,v 1.3 2006/02/05 23:09:52 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SUN_JRE14_BUILDLINK3_MK:=	${SUN_JRE14_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	sun-jre14
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsun-jre14}
BUILDLINK_PACKAGES+=	sun-jre14

.if !empty(SUN_JRE14_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.sun-jre14+=		sun-jre14-[0-9]*
BUILDLINK_RECOMMENDED.sun-jre14?=		sun-jre14>=2.9nb1
BUILDLINK_PKGSRCDIR.sun-jre14?=		../../lang/sun-jre14
BUILDLINK_JAVA_PREFIX.sun-jre14=	${PREFIX}/java/sun-1.4
.endif	# SUN_JRE14_BUILDLINK3_MK

UNLIMIT_RESOURCES+=	datasize	# Must be at least 131204

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
