# Dynogram: Nucleotide to Peptide Translator, using Lex and Yacc

This software translates nucleotides to peptides using lex and yacc. 

Run make to build. You need:

* `eperl` or Embedded Perl (sudo apt-get install eperl)
* `yacc` or `bison` (sudo apt-get install bison)
* `lex` or `flex` (sudo apt-get install flex)

Parameters:

* `-f` : Input file (default: stdin, if stdin is a valid file descriptor)
* `-o` : Output file  (default: stdout)


Examples:

```
dynogram -f file.fasta -o peps.fasta
```

```
cat file.fasta | dynogram
```

Dedicated to: The Late Dr. Kevin Moran of Oxford University
