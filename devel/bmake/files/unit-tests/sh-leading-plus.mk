# $NetBSD: sh-leading-plus.mk,v 1.1 2024/07/15 09:10:26 jperkin Exp $
#
# Tests for shell commands preceded by a '+', to run them even if
# the command line option -n is given.

.MAKEFLAGS: -n

all:
	@echo 'this command is not run'
	@+echo 'this command is run'

	# Since 2023-01-17, the leading '@', '+' and '-' may contain
	# whitespace, for compatibility with GNU make.
	+ + + @echo 'whitespace in leading part'
