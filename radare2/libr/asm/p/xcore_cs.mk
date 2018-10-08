OBJ_XCORECS=asm_xcore_cs.o

include p/capstone.mk

STATIC_OBJ+=${OBJ_XCORECS}
SHARED_OBJ+=${SHARED_XCORECS}
TARGET_XCORECS=asm_xcore_cs.${EXT_SO}

ifeq ($(WITHPIC),1)
ALL_TARGETS+=${TARGET_XCORECS}

${TARGET_XCORECS}: ${OBJ_XCORECS}
	${CC} $(call libname,asm_xcore) ${LDFLAGS} ${CFLAGS} $(CS_LDFLAGS) \
		-o ${TARGET_XCORECS} ${OBJ_XCORECS} ${SHARED2_XCORECS}
endif
