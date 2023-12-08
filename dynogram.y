%{
#include <stdio.h>
FILE*	 yyout;
FILE*	 yyin;

int     yylex(void);
int     yyparse(void);
void    yyerror(char* errormsg);

%}

<:

my @nucleotides = qw(A C G T);

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

my @codons = ();

for my $first (@nucleotides) {
    for my $second (@nucleotides) {
        for my $third (@nucleotides) {
            my $codon = $first . $second . $third;
            print "%token TRIP_$codon\n";
	    push @codons, $codon;
        }
    }
}
_
:>

%start dynogram

%%

dynogram : /* empty */
	 <:

for (@codons) {
	printf "\t| TRIP_%s  { fprintf(yyout, \"%s\"); }\n", $_, $codon_to_amino_acid{$_};
}

:>


%%

#include "lex.yy.c"
