# $NetBSD: depsrc-phony.mk,v 1.1 2024/07/15 09:10:14 jperkin Exp $
#
# Tests for the special source .PHONY in dependency declarations,
# which executes the commands for the target even if a file of the same
# name exists and would be considered up to date.

# Without the .PHONY, this target would be "up to date".
# expect: : depsrc-phony.mk is made.
${MAKEFILE}: .PHONY
	: ${.TARGET:T} is made.
