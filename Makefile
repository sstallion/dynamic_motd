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

DIRS=		SCRIPTSDIR

SCRIPTS=	dynamic_motd
SCRIPTSDIR=	${LIBEXECDIR}

FILESGROUPS=	DOCS EXAMPLES

DOCS=		CONTRIBUTING.md README.md
DOCSDIR=	${SHAREDIR}/doc/dynamic_motd

EXAMPLES=	examples/motd.subr examples/rc.motd
EXAMPLESDIR=	${SHAREDIR}/examples/dynamic_motd

CONFGROUPS=	CONFETC CONFRCD

CONFETC=	rc.motd.sample

CONFRCD=	rc.d/dynamic_motd
CONFRCDDIR=	${CONFDIR}/rc.d
CONFRCDMODE=	${BINMODE}

beforeinstall: installdirs
afterinstall: installconfig

.include <bsd.prog.mk>
