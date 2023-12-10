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

Dedicated to: The Late Dr. Kevin Moran of Oxford University
