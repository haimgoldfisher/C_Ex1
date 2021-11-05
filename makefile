CC = gcc
AR = ar
OBJECTS_MAIN = main.o
OBJECTS_BASIC = basicClassification.o
OBJECTS_REC = advancedClassificationRecursion.o
OBJECTS_LOOP = advancedClassificationLoop.o
OBJECTS_HEADER = NumClass.h
FLAGS = -Wall -g

all: mains maindloop maindrec loops loopd recursives recursived

mains: $(OBJECTS_MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(OBJECTS_MAIN) libclassrec.a -lm

maindloop: $(OBJECTS_MAIN) libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(OBJECTS_MAIN) ./libclassloops.so -lm

maindrec: $(OBJECTS_MAIN) libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(OBJECTS_MAIN) ./libclassrec.so -lm

loops: libclassloops.a

recursives: libclassrec.a

loopd: libclassloops.so

recursived: libclassrec.so

libclassloops.a: $(OBJECTS_LOOP) $(OBJECTS_BASIC)
	 ar -rcs libclassloops.a $(OBJECTS_LOOP) $(OBJECTS_BASIC) # creates static library

libclassloops.so: $(OBJECTS_LOOP) $(OBJECTS_BASIC)
	 $(CC) $(FLAGS) -shared -o libclassloops.so $(OBJECTS_LOOP) $(OBJECTS_BASIC) # creates dynamic library

libclassrec.a: $(OBJECTS_REC) $(OBJECTS_BASIC)
	 ar -rcs libclassrec.a $(OBJECTS_REC) $(OBJECTS_BASIC) # creates static library

libclassrec.so: $(OBJECTS_REC) $(OBJECTS_BASIC)
	 $(CC) $(FLAGS) -shared -o libclassrec.so $(OBJECTS_REC) $(OBJECTS_BASIC) # creates dynamic library

main.o: main.c NumClass.h
	$(CC) $(FLAGS) -c main.c

basicClassification.o: basicClassification.c
	$(CC) $(FLAGS) -c basicClassification.c -lm

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) $(FLAGS) -c advancedClassificationLoop.c -lm

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) $(FLAGS) -c advancedClassificationRecursion.c

clean: 
	rm -f *.o *.a *.so mains maindloop maindrec