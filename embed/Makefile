# This should work with GCC, but I don't use it

all: 
	ocamlc -output-obj -o test-embed.o test1.ml test2.ml
	clang test.c test-embed.o -lcamlrun -I`ocamlc -where` -L`ocamlc -where`
	./a.out
