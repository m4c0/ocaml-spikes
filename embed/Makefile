# This should work with GCC, but I don't use it

all: 
	dune build
	clang test.c _build/default/test_embed.exe.o -lcamlrun -I`ocamlc -where` -L`ocamlc -where`
	./a.out
