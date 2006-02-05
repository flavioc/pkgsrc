# $NetBSD: buildlink3.mk,v 1.2 2006/02/05 23:09:52 joerg Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
SUN_JDK15_BUILDLINK3_MK:=	${SUN_JDK15_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	sun-jdk15
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nsun-jdk15}
BUILDLINK_PACKAGES+=	sun-jdk15

.if !empty(SUN_JDK15_BUILDLINK3_MK:M+)

BUILDLINK_DEPENDS.sun-jdk15+=	sun-jdk15-[0-9]*
BUILDLINK_RECOMMENDED.sun-jdk15?=	sun-jdk15>=5.0.6nb1
BUILDLINK_PKGSRCDIR.sun-jdk15?=	../../lang/sun-jdk15
BUILDLINK_DEPMETHOD.sun-jdk15?= build

BUILDLINK_PASSTHRU_DIRS+=	${BUILDLINK_JAVA_PREFIX.sun-jre15}

BUILDLINK_CPPFLAGS.sun-jdk15=						\
	-I${BUILDLINK_JAVA_PREFIX.sun-jre15}/include			\
	-I${BUILDLINK_JAVA_PREFIX.sun-jre15}/include/linux

.include "../../lang/sun-jre15/buildlink3.mk"

.endif	# SUN_JDK15_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
