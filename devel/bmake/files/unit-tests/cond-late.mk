# $NetBSD: cond-late.mk,v 1.3 2024/07/15 09:10:11 jperkin Exp $
#
# Using the :? modifier, expressions can contain conditional
# expressions that are evaluated late, at expansion time.
#
# Any expressions appearing in these conditions are expanded before parsing
# the condition.  This is different from conditions in .if directives, where
# expressions are evaluated individually and only as far as necessary, see
# cond-short.mk.
#
# Because of this, variables that are used in these lazy conditions
# should not contain double-quotes, or the parser will probably fail.
#
# They should also not contain operators like == or <, since these are
# actually interpreted as these operators. This is demonstrated below.
#

all: parse-time cond-literal

parse-time: .PHONY
	@${MAKE} -f ${MAKEFILE} do-parse-time || true

COND.true=	"yes" == "yes"
COND.false=	"yes" != "yes"

# If the order of evaluation were to change to first parse the condition
# and then expand the variables, the output would change from the
# current "yes no" to "yes yes", since both variables are non-empty.
# expect: yes
# expect: no
cond-literal:
	@echo ${ ${COND.true} :?yes:no}
	@echo ${ ${COND.false} :?yes:no}

.if make(do-parse-time)
VAR=	${${UNDEF} != "no":?:}
# expect+1: while evaluating variable "VAR" with value "${${UNDEF} != "no":?:}": while evaluating condition " != "no"": Bad condition
.  if empty(VAR:Mpattern)
.  endif
.endif
