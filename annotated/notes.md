A ground up guide to COMPASS
===


## Linux

COMPASS is designed to be used via the Linux _shell_ (specifically the bash shell). It is similar to command prompt and terminal 
but includes a lot of nice features. _Shell scripts_ are files containing a line of commands that are fed
into the shell. These scripts make use of familiar coding elements to preform a large number of tasks
quickly and accuratley. I found [this](https://www.tutorialspoint.com/unix/shell_scripting.htm) website helpful
when getting started with the shell, but there are many other resoureces available. Some concepts that are 
used extensivley by COMPASS are included below.

Searching for and using files in shell is dependent on **regex** (regular expression) terminology. There are also several 
prefixes to specify file type

| Symbol        | Filetype      |
| --------|:-------------:|
| - | Regular file, such as an ASCII text file, binary executable, or hard link | 
| b | Block special file. Block input/output device file such as a physical hard drive    |
| c | Character special file. Raw input/output device file such as a physical hard drive |
| d | Directory file that contains a listing of other files and directories |
| l | Symbolic link file. Links on any regular file |
| p | Named pipe. A mechanism for interprocess communications |
| s | Socket used for interprocess communication |

#### if... fi statements
Shell equivalent of if statement i.e.
```console
#!/bin/sh

a=10
b=20

if [ $a == $b ]
then
   echo "a is equal to b"
fi

if [ $a != $b ]
then
   echo "a is not equal to b"
fi
```

## Programs

COMPASS relies on many existing bioinformatics tools to pre-process the data. These include the following:
- **Cutadapt:** finds and removes adapter sequences, primers, poly-A tails and other types of unwanted sequence from your high-throughput sequencing reads.
- **BBMap:**  short read aligner for DNA and RNA-seq data. Capable of handling arbitrarily large genomes with millions of scaffolds. Handles Illumina, PacBio, 454, and other reads; very high sensitivity and tolerant of errors and numerous large indels. Very fast.
- **HISAT2:** graph-based alignment of next generation sequencing reads to a population of genomes.
- **STAR:** Spliced Transcripts Alignment to a Reference. Another alignment tool that is very robust and accurate, but requires more resources that HISAT2.
- **Magic-BLAST:** Magic-BLAST is a tool for mapping large next-generation RNA or DNA sequencing runs against a whole genome or transcriptome. Each alignment optimizes a composite score, taking into account simultaneously the two reads of a pair, and in case of RNA-seq, locating the candidate introns and adding up the score of all exons. This is very different from other versions of BLAST, where each exon is scored as a separate hit and read-pairing is ignored.
- **GSNAP:** Genomic Short-read Nucleotide Alignment Program) is a tool to align single- and paired-end reads to a reference genome. The GSNAP algorithm is based on the seed-and-extend method and works on reads down to 14 nucleotides of length, and computes SNP-tolerant alignments of various combinations of major and minor alleles. The algorithm can discover long-distance and interchromosomal splicing events by utilizing known splice sites data or by probabilistic models.
