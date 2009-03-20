# $NetBSD: buildlink3.mk,v 1.16 2009/03/20 19:24:08 joerg Exp $

BUILDLINK_TREE+=	GConf

.if !defined(GCONF_BUILDLINK3_MK)
GCONF_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.GConf+=	GConf>=2.8.0.1
BUILDLINK_ABI_DEPENDS.GConf?=	GConf>=2.12.1nb1
BUILDLINK_PKGSRCDIR.GConf?=	../../devel/GConf

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../net/ORBit2/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.include "../../textproc/libxml2/buildlink3.mk"
.include "../../textproc/xmlcatmgr/buildlink3.mk"

BUILDLINK_TARGETS+=	GConf-buildlink-fake
_GCONF_FAKE=		${BUILDLINK_DIR}/bin/gconftool-2

.PHONY: GConf-buildlink-fake
GConf-buildlink-fake:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if [ ! -f ${_GCONF_FAKE} ]; then				\
		${ECHO_BUILDLINK_MSG} "Creating ${_GCONF_FAKE}";	\
		${MKDIR} ${_GCONF_FAKE:H};				\
		${ECHO} "#!${SH}" > ${_GCONF_FAKE};			\
		${CHMOD} +x ${_GCONF_FAKE};				\
	fi
.endif # GCONF_BUILDLINK3_MK

BUILDLINK_TREE+=	-GConf
