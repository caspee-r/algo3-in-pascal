
all: testarr testll

stackarr: 
	fpc -dARRAY stackdsa.pp

stackll: 
	fpc stackdsa.pp

testarr: stackarr
	fpc testarr.pas

testll: stackll
	fpc testll.pas
clean:
	 rm -f stackdsa.o  stackdsa.ppu  testarr.o  testarr  testll
