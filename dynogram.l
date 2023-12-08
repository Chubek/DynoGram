%option case-insensitive

%%
<:

my @nucleotides = qw(A C G T);

for my $first (@nucleotides) {
    for my $second (@nucleotides) {
        for my $third (@nucleotides) {
            my $codon = $first . $second . $third;
            print "$codon 		 return TRIP_$codon;\n";
        }
    }
}
:>

[^ATCG]	ECHO;


%%


void 
yyerror(char* errormsg)
{
	fprintf(stderr, "Error occured: %s\n", errormsg);
	exit(EXIT_FAILURE);
}

void
do_at_exit(void)
{
	if (yyin != NULL) 
		fclose(yyin);
	if (yyout != NULL) 
		fclose(yyout);
}

int
main(int argc, char** argv)
{
	atexit(do_at_exit);

	yyin 	= isatty(fileno(stdin)) ? NULL : stdin;
	yyout 	= stdout;
	
	int opt;
	while ((opt = getopt(argc, argv, "f:o:")) != -1)
	{	
		switch (opt) 
		{
			case 'f':
				yyin = fopen(optarg, "r");
				break;
			case 'o':
				yyout = fopen(optarg, "w");
				break;
			default:
				break;
		}

	}

	if (yyin == NULL)
	{
		fprintf(stderr, "Error: stdin is not a file descriptor and no input is given\n");
		exit(EXIT_FAILURE);
	}

	while (yyparse())
		;

	return EXIT_SUCCESS;
}
