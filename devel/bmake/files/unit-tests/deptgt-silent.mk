# $NetBSD: deptgt-silent.mk,v 1.1 2024/07/15 09:10:16 jperkin Exp $
#
# Tests for the special target .SILENT in dependency declarations.

.SILENT: all

all: loud
	@echo 'This is not echoed because of the @.'
	# Without the .SILENT, the following command would be echoed.
	echo 'This is not echoed because of the .SILENT.'

# Demonstrate that the .SILENT only applies to the particular target.
# This is unlike .DELETE_ON_ERROR, which is a global setting.
loud: .PHONY
	echo 'This is a loud command.'
