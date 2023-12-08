dynogram: y.tab.c
	cc $(DEBUG) -o dynogram y.tab.c -ll

y.tab.c: lex.yy.c
	yacc dynogram.gen.y

lex.yy.c: dynogram.gen.l
	lex dynogram.gen.l

dynogram.gen.l: dynogram.gen.y
	eperl dynogram.l > dynogram.gen.l

dynogram.gen.y: clean
	eperl dynogram.y > dynogram.gen.y


.PHONY : clean
	rm -f dynogram.gen.l dynogram.gen.y y.tab.c lex.yy.c dynogram
