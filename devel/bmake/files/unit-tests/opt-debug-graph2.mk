# $NetBSD: opt-debug-graph2.mk,v 1.1 2024/07/15 09:10:23 jperkin Exp $
#
# Tests for the -dg2 command line option, which prints the input
# graph after making everything, or before exiting on error.
#
# Before compat.c 1.222 from 2021-02-02, there was no debug output despite
# the error.

.MAKEFLAGS: -dg2

.MAIN: all

made-target: .PHONY
	: 'Making $@.'

error-target: .PHONY
	false

aborted-target: .PHONY aborted-target-dependency
aborted-target-dependency: .PHONY
	false

all: made-target error-target aborted-target
