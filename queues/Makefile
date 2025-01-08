
all: queuedsa_array_by_flow queuedsa_array_by_shift queuedsa_ll

queuedsa_array_by_flow:
	fpc -dARRAY queuedsa.pp -oqueuedsaflow

queuedsa_array_by_shift:
	fpc -dARRAY -dBYSHIFT queuedsa.pp -oqueuedsashift

queuedsa_ll:
	fpc queuedsa.pp -oqueuedsa_ll

test_array_by_flow: queuedsa_array_by_flow
	fpc testarrflow.pas

test_array_by_shift: queuedsa_array_by_shift
	fpc testarrshift.pas


test_ll: queuedsa_ll
	fpc testll.pas

clean:
	 rm -f testll.o  testll  testarrshift.o  testarrshift  testarrflow.o  testarrflow queuedsaflow\
		 queuedsashift  queuedsa_ll  queuedsaflow.o  queuedsashift.o  queuedsa_ll.o queuedsa.o queuedsa.ppu

