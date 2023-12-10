%option case-insensitive

%%
<:

my %codon_to_amino_acid = (
    'TTT' => 'Phenylalanine',
    'TTC' => 'Phenylalanine',
    'TTA' => 'Leucine',
    'TTG' => 'Leucine',
    'CTT' => 'Leucine',
    'CTC' => 'Leucine',
    'CTA' => 'Leucine',
    'CTG' => 'Leucine',
    'ATT' => 'Isoleucine',
    'ATC' => 'Isoleucine',
    'ATA' => 'Isoleucine',
    'ATG' => 'Methionine',
    'GTT' => 'Valine',
    'GTC' => 'Valine',
    'GTA' => 'Valine',
    'GTG' => 'Valine',
    'TCT' => 'Serine',
    'TCC' => 'Serine',
    'TCA' => 'Serine',
    'TCG' => 'Serine',
    'CCT' => 'Proline',
    'CCC' => 'Proline',
    'CCA' => 'Proline',
    'CCG' => 'Proline',
    'ACT' => 'Threonine',
    'ACC' => 'Threonine',
    'ACA' => 'Threonine',
    'ACG' => 'Threonine',
    'GCT' => 'Alanine',
    'GCC' => 'Alanine',
    'GCA' => 'Alanine',
    'GCG' => 'Alanine',
    'TAT' => 'Tyrosine',
    'TAC' => 'Tyrosine',
    'TAA' => 'Stop',
    'TAG' => 'Stop',
    'CAT' => 'Histidine',
    'CAC' => 'Histidine',
    'CAA' => 'Glutamine',
    'CAG' => 'Glutamine',
    'AAT' => 'Asparagine',
    'AAC' => 'Asparagine',
    'AAA' => 'Lysine',
    'AAG' => 'Lysine',
    'GAT' => 'Aspartic Acid',
    'GAC' => 'Aspartic Acid',
    'GAA' => 'Glutamic Acid',
    'GAG' => 'Glutamic Acid',
    'TGT' => 'Cysteine',
    'TGC' => 'Cysteine',
    'TGA' => 'Stop',
    'TGG' => 'Tryptophan',
    'CGT' => 'Arginine',
    'CGC' => 'Arginine',
    'CGA' => 'Arginine',
    'CGG' => 'Arginine',
    'AGT' => 'Serine',
    'AGC' => 'Serine',
    'AGA' => 'Arginine',
    'AGG' => 'Arginine',
    'GGT' => 'Glycine',
    'GGC' => 'Glycine',
    'GGA' => 'Glycine',
    'GGG' => 'Glycine',
);


my @nucleotides = qw(A C G T);

for my $first (@nucleotides) {
    for my $second (@nucleotides) {
        for my $third (@nucleotides) {
            my $codon = $first . $second . $third;
            print "$codon 		 { fprintf(yyout, \"%s \", \"$codon_to_amino_acid{$codon}\"); };\n";
        }
    }
}
:>

^[>^ ]$	 ECHO;
\n	 ECHO;

<<EOF>>  { fputs("<: if ($^O =~ /win*/) { print "\\r\\n"; } else  { print "\\n"; } :>", yyout) ; yyterminate(); }

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

	while (yylex())
		;

	return EXIT_SUCCESS;
}
