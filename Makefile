TARGETS	=all clean clobber diff distclean import install uninstall
TARGET	=all

SUBDIRS	=

.PHONY:	${TARGETS} ${SUBDIRS}

PREFIX	=${DESTDIR}/opt
BINDIR	=${PREFIX}/bin

INSTALL	=install

all::	show-asmlib-labels

${TARGETS}::

clobber distclean:: clean

check::	show-asmlib-labels
	./show-asmlib-labels ${ARGS}

install:: show-asmlib-labels
	${INSTALL} -D -c show-asmlib-labels ${BINDIR}/show-asmlib-labels

uninstall::
	${RM} ${BINDIR}/show-asmlib-labels

# Keep at bottom so we do local stuff first.

ifneq	(,${SUBDIRS})
${TARGETS}::
	${MAKE} TARGET=$@ ${SUBDIRS}

${SUBDIRS}::
	${MAKE} -C $@ ${TARGET}
endif
