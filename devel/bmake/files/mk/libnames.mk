# SPDX-License-Identifier: BSD-2-Clause
#
# $Id: libnames.mk,v 1.3 2024/07/15 09:10:09 jperkin Exp $
#
#	@(#) Copyright (c) 2007-2009, Simon J. Gerraty
#
#	This file is provided in the hope that it will
#	be of use.  There is absolutely NO WARRANTY.
#	Permission to copy, redistribute or otherwise
#	use this file is hereby granted provided that
#	the above copyright notice and this notice are
#	left intact.
#
#	Please send copies of changes and bug-fixes to:
#	sjg@crufty.net
#

DLIBEXT ?= .a
DSHLIBEXT ?= .so

.-include <local.libnames.mk>
.-include <sjg.libnames.mk>
.-include <fwall.libnames.mk>
.-include <host.libnames.mk>
