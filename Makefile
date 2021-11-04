CC=gcc
AR = ar
OBJECTS_MAIN = main.o
OBJECTS_BASIC = basicClassification.o
OBJECTS_REC = advancedClassificationRecursion.o
OBJECTS_LOOP = advancedClassificationLoop.o
OBJECTS_HEADER = NumClass.h
FLAGS = -Wall -g

all: mains maindloop maindrec loops loopd recursives recursivesd

mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libclassrec.a -lm

maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(OBJECTS_MAIN) ./libclassloops.so -lm

maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(OBJECTS_MAIN) ./libclassrec.so -lm

loops: libclassloops.a

recursives: libclassrec.a

loopd: libclassloops.so

recursivesd: libclassrec.so

libclassloops.a: $(OBJECTS_LOOP) $(OBJECTS_BASIC)
	 ar -rcs libclassloops.a $(OBJECTS_LOOP) $(OBJECTS_BASIC) # creates library

libclassloops.so: $(OBJECTS_LOOP) $(OBJECTS_BASIC)
	 $(CC) -shared -o libclassloops.so $(OBJECTS_LOOP) $(OBJECTS_BASIC) # creates dynamic library

libclassrec.a: $(OBJECTS_REC) $(OBJECTS_BASIC)
	 ar -rcs libclassrec.a $(OBJECTS_REC) $(OBJECTS_BASIC) # creates library

libclassrec.so: $(OBJECTS_REC) $(OBJECTS_BASIC)
	 $(CC) -shared -o libclassrec.so $(OBJECTS_REC) $(OBJECTS_BASIC) # creates dynamic library

main.o: main.c NumClass.h
	$(CC) -c main.c

basicClassification.o: basicClassification.c
	$(CC) -c basicClassification.c -lm

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) -c advancedClassificationLoop.c -lm

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) -c advancedClassificationRecursion.c

.PHONY:	clean all

clean: 
	rm -f *.o *.a *.so mains maindloop maindrec