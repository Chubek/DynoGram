dynogram: lex.yy.c
	cc $(DEBUG) -o dynogram lex.yy.c -ll

lex.yy.c: dynogram.gen.l
	lex dynogram.gen.l

dynogram.gen.l: clean
	eperl dynogram.l > dynogram.gen.l


.PHONY : clean
	rm -f dynogram.gen.l dynogram.gen.y y.tab.c lex.yy.c dynogram
