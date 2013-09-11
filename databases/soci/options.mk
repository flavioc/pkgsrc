# $NetBSD: options.mk,v 1.1 2013/09/11 12:22:33 joerg Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.soci
PKG_SUPPORTED_OPTIONS=	mysql pgsql sqlite
PKG_SUGGESTED_OPTIONS=	pgsql

.include "../../mk/bsd.options.mk"

PLIST_VARS+=	${PKG_SUPPORTED_OPTIONS}

CMAKE_ARGS+=	-DWITH_ODBC=off -DWITH_ORACLE=off \
		-DWITH_FIREBIRD=off -DWITH_DB2=off

PLIST_VARS+=	mysql pgsql sqlite

.if !empty(PKG_OPTIONS:Mmysql)
.include "../../mk/mysql.buildlink3.mk"
CMAKE_ARGS+=	-DWITH_MYSQL=on
PLIST.mysql=	yes
.else
CMAKE_ARGS+=	-DWITH_MYSQL=off
.endif

.if !empty(PKG_OPTIONS:Mpgsql)
.include "../../mk/pgsql.buildlink3.mk"
CMAKE_ARGS+=	-DWITH_POSTGRESQL=on
PLIST.pgsql=	yes
.else
CMAKE_ARGS+=	-DWITH_POSTGRESQL=off
.endif

.if !empty(PKG_OPTIONS:Msqlite)
.include "../../databases/sqlite3/buildlink3.mk"
CMAKE_ARGS+=	-DWITH_SQLITE3=on
PLIST.sqlite=	yes
.else
CMAKE_ARGS+=	-DWITH_SQLITE3=off
.endif
