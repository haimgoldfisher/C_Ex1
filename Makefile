CC = gcc
CFLAGS = -Wall -Werror
AR = ar
OBJECTS_BASIC = basicClassification.o
OBJECTS_LOOPS = advancedClassificationLoop.o
OBJECTS_RECURSION = advancedClassificationRecursion.o

all: loops recursives recursived loopd mains maindloop maindrec

loopd: libclassloops.so
loops: libclassloops.a
recursived: libclassrec.so
recursives: libclassrec.a

mains: main.o libclassrec.a
	${CC} ${CFLAGS} main.o -L . -lclassrec -lm -o mains

maindrec: main.o libclassrec.so
	${CC} ${CFLAGS} main.o -L . -lclassrec -lm -o maindrec

maindloop: main.o libclassloops.so
	${CC} ${CFLAGS} main.o -L . -lclassloops -lm -o maindloop

libclassloops.so: ${OBJECTS_BASIC} ${OBJECTS_LOOPS}
	${CC} ${CFLAGS} -shared ${OBJECTS_LOOPS} ${OBJECTS_BASIC} -o libclassloops.so

libclassloops.a: ${OBJECTS_BASIC} ${OBJECTS_LOOPS}
	${AR} -rcs libclassloops.a  ${OBJECTS_BASIC} ${OBJECTS_LOOPS}

libclassrec.so: ${OBJECTS_BASIC} ${OBJECTS_RECURSION}
	${CC} ${CFLAGS} -shared ${OBJECTS_BASIC} ${OBJECTS_RECURSION} -o libclassrec.so

libclassrec.a: ${OBJECTS_BASIC} ${OBJECTS_RECURSION}
	${AR} -rcs libclassrec.a ${OBJECTS_BASIC} ${OBJECTS_RECURSION}

main.o: main.c NumClass.h
	${CC} ${CFLAGS} -c main.c

basicClassification.o: basicClassification.c
	${CC} ${CFLAGS} -fPIC -c basicClassification.c

advancedClassificationLoop.o: advancedClassificationLoop.c
	${CC} ${CFLAGS} -fPIC -c advancedClassificationLoop.c

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	${CC} ${CFLAGS} -fPIC -c advancedClassificationRecursion.c

clean:
	rm -f *.a *.o *.so  maindrec maindloop mains