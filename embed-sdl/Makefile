# This should work with GCC, but I don't use it
# It might fail on some systems due to weirdness in sdl2-config - manually patching it seems to work

all: 
	dune build
	clang _build/default/test_embed.exe.o -lSDL2
	./a.out
