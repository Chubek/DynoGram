# Dynogram: Nucleotide to Peptide Translator, using Lex and Yacc

This software translates nucleotides to peptides using lex. 

Run make to build. You need:

* `eperl` or Embedded Perl (sudo apt-get install eperl)
* `lex` or `flex` (sudo apt-get install flex)

Parameters (after you have compiled it):

* `-f` : Input file (default: stdin, if stdin is a valid file descriptor)
* `-o` : Output file  (default: stdout)


Examples:

```
dynogram -f sample.fa -o peps.fa
```

```
cat sample.fa | dynogram
```

The example file will come out as:

```
>Genoma_CpI19_Refinada_v2
Valine Serine Glutamic Acid Alanine Proline Serine Threonine Tryptophan Asparagine Glutamic Acid Arginine Tryptophan Glutamine Glutamic Acid Valine Threonine Asparagine Glutamic Acid Leucine Leucine 
Serine Glutamine Serine Glutamine Aspartic Acid Proline Glutamic Acid Serine Glycine Isoleucine Serine Isoleucine Threonine Arginine Glutamine Glutamine Serine Alanine Tyrosine Leucine 
Arginine Leucine Valine Lysine Proline Valine Alanine Phenylalanine Valine Glutamic Acid Glycine Isoleucine Alanine Valine Leucine Serine Valine Proline Histidine Alanine 
Arginine Alanine Lysine Lysine Glutamic Acid Isoleucine Glutamic Acid Threonine Threonine Leucine Glycine Proline Valine Isoleucine Threonine Glutamic Acid Valine Leucine Serine Arginine 
Arginine Leucine Glycine Arginine Glutamine Tyrosine Serine Leucine Alanine Valine Serine Valine Histidine Alanine Proline Glutamic Acid Glutamic Acid Asparagine Proline Glutamic Acid 
Valine Serine Serine Alanine Threonine Proline Aspartic Acid Alanine Valine Serine Tyrosine Tyrosine Glutamine Glutamic Acid Glutamine Serine Alanine Valine Serine Glycine 
Glutamine Tyrosine Glycine Alanine Threonine Serine Alanine Asparagine Alanine Aspartic Acid Phenylalanine Glutamine Asparagine Glutamine Glutamine Serine Threonine Isoleucine Tyrosine Arginine 
Lysine Proline Glutamine Glutamic Acid Serine Glutamine Tyrosine Proline Valine Threonine Phenylalanine Glycine Alanine Serine Serine Tyrosine Glycine Asparagine Glutamic Acid Lysine 
Tyrosine Glutamine Glutamic Acid Asparagine Serine Glutamine Aspartic Acid Glutamine Glycine Isoleucine Serine Histidine Histidine Proline Tyrosine Glycine Phenylalanine Asparagine Glutamic Acid Alanine 
Glutamine Arginine Isoleucine Alanine Serine Serine Alanine Serine Histidine Alanine Valine Proline Glutamine Serine Glycine Serine Glutamic Acid Leucine Leucine Histidine 
```

Dedicated to: The Late Dr. Kevin Moran of Oxford University
