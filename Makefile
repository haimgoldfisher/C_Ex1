CC=gcc
AR=ar
HEADER = NumClass.h
BASIC_FILE = basicClassification.o
RECURSE_FILE = advancedClassificationRecursion.o
LOOP_FILE = advancedClassificationLoop.o
MAIN_FILE = main.o
FLAGS = -Wall -g

all: mains maindloop maindrec loops loopd recursives recursivesd

mains: $(MAIN) libclassrec.a
	$(CC) $(FLAGS) -o mains $(MAIN_FILE) libclassrec.a -lm

maindloop: $(MAIN_FILE) libclassloops.so
	$(CC) $(FLAGS) -o maindloop $(MAIN_FILE) ./libclassloops.so -lm

maindrec: $(MAIN_FILE) libclassrec.so
	$(CC) $(FLAGS) -o maindrec $(MAIN_FILE) ./libclassrec.so -lm

loops: libclassloops.a

recursives: libclassrec.a

loopd: libclassloops.so

recursivesd: libclassrec.so

libclassloops.a: $(LOOP_FILE) $(BASIC_FILE)
	 ar -rcs libclassloops.a $(LOOP_FILE) $(BASIC_FILE) # creates library

libclassloops.so: $(LOOP_FILE) $(BASIC_FILE)
	 $(CC) -shared -o libclassloops.so $(LOOP_FILE) $(BASIC_FILE) # creates dynamic library

libclassrec.a: $(RECURSE_FILE) $(BASIC_FILE)
	 ar -rcs libclassrec.a $(RECURSE_FILE) $(BASIC_FILE) # creates library

libclassrec.so: $(RECURSE_FILE) $(BASIC_FILE)
	 $(CC) -shared -o libclassrec.so $(RECURSE_FILE) $(BASIC_FILE) # creates dynamic library

main.o: main.c NumClass.h
	$(CC) -c main.c

basicClassification.o: basicClassification.c
	$(CC) -c basicClassification.c -lm

advancedClassificationLoop.o: advancedClassificationLoop.c
	$(CC) -c advancedClassificationLoop.c -lm

advancedClassificationRecursion.o: advancedClassificationRecursion.c
	$(CC) -c advancedClassificationRecursion.c -lm

.PHONY:	clean all

clean: 
	rm -f *.o *.a *.so mains maindloop maindrec