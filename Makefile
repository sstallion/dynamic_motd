# SPDX-License-Identifier: BSD-2-Clause
#
# Copyright (c) 2022 Steven Stallion <sstallion@gmail.com>
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.

NO_OBJ=

LOCALBASE?=	/usr/local
PREFIX?=	${LOCALBASE}

CONFDIR=	${PREFIX}/etc
LIBEXECDIR=	${PREFIX}/libexec
SHAREDIR=	${PREFIX}/share

SCRIPTS=	dynamic_motd
SCRIPTSDIR=	${LIBEXECDIR}

DOCS=		CONTRIBUTING.md README.md
DOCSDIR=	${SHAREDIR}/doc/dynamic_motd

EXAMPLES=	examples/motd.subr examples/rc.motd
EXAMPLESDIR=	${SHAREDIR}/examples/dynamic_motd

CONFETC=	rc.motd.sample

CONFRCD=	rc.d/dynamic_motd
CONFRCDDIR=	${CONFDIR}/rc.d

CLEANFILES=	rc.d/dynamic_motd
PREFIX_SUB=	-e 's,@@PREFIX@@,${PREFIX},g'

INSTALL_DATA=	install -m 0644
INSTALL_SCRIPT=	install -m 0555
MKDIR=		mkdir -p

all: rc.d/dynamic_motd

rc.d/dynamic_motd: rc.d/dynamic_motd.in
	sed ${PREFIX_SUB} ${.ALLSRC} >${.TARGET}

install: installdirs
	${INSTALL_SCRIPT} ${CONFRCD}  ${DESTDIR}${CONFRCDDIR}
	${INSTALL_DATA}   ${CONFETC}  ${DESTDIR}${CONFDIR}
	${INSTALL_SCRIPT} ${SCRIPTS}  ${DESTDIR}${SCRIPTSDIR}
	${INSTALL_DATA}   ${DOCS}     ${DESTDIR}${DOCSDIR}
	${INSTALL_DATA}   ${EXAMPLES} ${DESTDIR}${EXAMPLESDIR}

installdirs:
.for dir in ${CONFRCDDIR} ${CONFDIR} ${SCRIPTSDIR} ${DOCSDIR} ${EXAMPLESDIR}
	${MKDIR} ${DESTDIR}${dir}
.endfor

