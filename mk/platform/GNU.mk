# $NetBSD: GNU.mk,v 1.40 2024/03/16 22:55:42 nia Exp $
#
# Variable definitions for the FreeBSD operating system.

ECHO_N?=	${ECHO} -n
IMAKEOPTS+=	-DBuildHtmlManPages=NO
PKGLOCALEDIR?=	share
PS?=		/bin/ps
SU?=		/usr/bin/su
TYPE?=		type				# Shell builtin

CPP_PRECOMP_FLAGS?=	# unset
DEF_UMASK?=		0022
EXPORT_SYMBOLS_LDFLAGS?=	# Don't add symbols to the dynamic symbol table
NOLOGIN?=		/sbin/nologin
PKG_TOOLS_BIN?=		${LOCALBASE}/sbin
ROOT_CMD?=		${SU} - root -c
ROOT_USER?=		root
ROOT_GROUP?=	root
ULIMIT_CMD_datasize?=	ulimit -d `ulimit -H -d`
ULIMIT_CMD_stacksize?=	ulimit -s `ulimit -H -s`
ULIMIT_CMD_memorysize?=	ulimit -m `ulimit -H -m`
ULIMIT_CMD_cputime?=	ulimit -t `ulimit -H -t`

_OPSYS_SYSTEM_RPATH?=	/lib:/usr/lib	# STANDARD_LIBRARY_PATH (from rtld.h)
_OPSYS_LIB_DIRS?=	/lib /usr/lib /lib/i386-gnu
_OPSYS_INCLUDE_DIRS?=	/usr/include

_OPSYS_HAS_INET6=	yes	# IPv6 is standard
_OPSYS_HAS_JAVA=	no	# Java is not standard
_OPSYS_HAS_MANZ=	no	# no MANZ for gzipping of man pages
_OPSYS_HAS_OSSAUDIO=	no	# libossaudio is unavailable
_OPSYS_PERL_REQD=		# no base version of perl required
_OPSYS_PTHREAD_AUTO=	no	# -lpthread needed for pthreads
_OPSYS_SHLIB_TYPE=	ELF	# shared lib type
_PATCH_CAN_BACKUP=	yes	# native patch(1) can make backups
_PATCH_BACKUP_ARG?= 	-b -V simple -z	# switch to patch(1) for backup suffix
_USE_RPATH=		yes	# add rpath to LDFLAGS

_STRIPFLAG_CC?=		${_INSTALL_UNSTRIPPED:D:U-s}	# cc(1) option to strip
_STRIPFLAG_INSTALL?=	${_INSTALL_UNSTRIPPED:D:U-s}	# install(1) option to strip

DEFAULT_SERIAL_DEVICE?=	/dev/null
SERIAL_DEVICES?=	/dev/null

OPSYS_HAS_POSIX_SPAWN=	# defined
OPSYS_HAS_SENDFILE=	# defined

# Register support for SSP on x86 architectures
.if (${MACHINE_ARCH} == "i386") || \
    (${MACHINE_ARCH} == "x86_64")
_OPSYS_SUPPORTS_SSP=	yes
.endif

_OPSYS_CAN_CHECK_SHLIBS=	yes # use readelf in check/bsd.check-vars.mk
_OPSYS_CAN_CHECK_SSP=		no  # only supports libssp at this time

# check for maximum command line length and set it in configure's environment,
# to avoid a test required by the libtool script that takes forever.
# TODO
#_OPSYS_MAX_CMDLEN_CMD=	/sbin/sysctl -n kern.argmax

.if ${MACHINE_ARCH} == "x86_64"
ABI?=		64
.endif

.for _glibc_path in ${_OPSYS_LIB_DIRS}
.  if exists(${_glibc_path}/libc.so.0.3)
## Use _CMD so the command only gets run when needed!
_GLIBC_VERSION_CMD=	if [ -x ${_glibc_path}/libc.so.0.3 ]; then \
				${_glibc_path}/libc.so.0.3 --version | \
				sed -ne's/^GNU C.*version \(.*\)[,.].*$$/\1/p'; \
			else \
				ldd --version |	\
				sed -ne's/^ldd.* \(.*\)$$/\1/p'; \
			fi
.  endif
.endfor

# In case we can't find glibc in any of the normal library paths
# try ldconfig.
_GLIBC_VERSION_CMD?=	ldconfig --version | \
				sed -ne's/ldconfig (GNU libc) \(.*\)$$/\1/p'

GLIBC_VERSION=		${_GLIBC_VERSION_CMD:sh}

# Define path max as the Hurd does not define it.
CFLAGS+=	-DMAXPATHLEN=4096 -DPATH_MAX=4096
