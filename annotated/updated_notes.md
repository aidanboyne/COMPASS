# HOFFMAN
### Login
1. MobaXTerm:
 - login: ---
 - PW: ---
 - qrsh (takes you to compute node)
2. WinSCP
 - check presaved session for details, same PW

### Paths to change
- In COMPASS_install_required_programs.sh: change SCRIPTS="/path/to/scripts/" to directory with the config.yml file ,process_reads_and_align.sh, and other COMPASS.sh bash files. For example, I changed my path to /u/project/guillom/kevinh97/aidanb/kr_compass

### Installing SRA Toolkit
See [here](https://github.com/aidanboyne/COMPASS/blob/36d31d4cb5aef9b75e67dfd414db65c51a9d5e71/annotated/walkthrough.md)

Note that to run binary files (such as vdb-config) you have to type "./" before the file name in command line. For example, to run vdb-config as detailed in the quickstart SRA guide, you would run "./vdb-config -i"

### Get Data
Retrived from [SRA Database](https://www.ncbi.nlm.nih.gov/Traces/study/?acc=SRX7170480&o=acc_s%3Aa): SRA10480750
 - via $fasterq-dump SRA10480750 
 - output into ./aidanboyne/output
 - temp into ./aidanboyne/data

should output
join    :|---- 100%
concat  :|---- 100%
spots read      : about 3.6 million
reads read      : about 7.2 million
reads written   : about 7.2 million (should be same as above)

##### Example:

_Path Definitions_

```
sra_path='/u/project/guillom/kevinh97/aidanb/sratoolkit/bin/'
out_path='/u/project/guillom/kevinh97/aidanb/sradata/'
temp_path='/u/project/guillom/kevinh97/aidanb/tempfiles/'
```
_Command Execution_

Goto fasterq-dump directory
1. cd $sra_path
Dump SRA file into desired location
2. ./fasterq-dump SRR10480750 -O $out_path -t $temp_path -p

### COMPASS_install_required_programs.sh
- Installs samfixcigar's bioinformatics toolkits
- Runs in linux shell
- sets directory
- All other programs can be downloaded w/ conda

Note: running bash COMPASS_install_required_programs will cause 2 errors. First is that VM will not be able to allocate as much memory as it wants (this is fine). Second is the COMPASS_environment.yml file will be missing. Copy this file from KR's github into the jvarkit folder that is created and then run the command `conda env create -f COMPASS_environment.yml`*

_*Unfortunatley this causes another error: libgcc-s.so.1 must be installed for pthread-cancel to work.I am not sure how to resolve this at the moment._

### COMPASS.sh (run for each sample):	

_To run each of the following, input: bash file-name.sh_ 

#### process_reads_and_align.sh
- Read 3′ trimming for polyA tails and base calling quality scores (cutadapt)
- Assigns consecutive numbers to each read in the fastq file (awk).
- Alignment with multiple aligners: BBMap, STAR (both default and noncanonical splicing modes), HISAT2 (both default and noncanonical splicing modes), Magic-BLAST, and GSNAP.
    - Genome indices are built for each aligner only if necessary (i.e. when running the first time).
    - Sam files are converted to .bam format (samtools view), sorted by mapped reference coordinates (samtools sort), cigars reformatted to SAM format 1.4 (samfixcigar), and then sorted by read numbers (samtools sort).

#### compare_splice_junctions_from_multiple_aligners.py
- Comparison of Multiple Programs for Accurate Splice Site discovery (COMPASS) core program
- Adjustment of ambiguous junctions to most likely splice sites based on species-specific splice signals

#### add_exonic_intronic_sequence.py
- Adjustment of ambiguous junctions to most likely splice sites based on species-specific splice signals

#### create_splice_site_bed.py

#### add_unspliced_read_counts_to_junctions.py

#### COMPASS_combine_junction_tables_from_multiple_samples.py
- Alternative splice junction calling
- Junction quality filtering

#### Downstream analysis programs:
- COMPASS_write_BP_3SS_to_fasta.py
- COMPASS_analyze_BP_3SS_RNA_folds_for_annotated_introns.py


#### Known Issues
- High memory usage. Standard Hoffman account may not support scripts and may cause unexpected termination.
    - Solution: Move to project-guillom folder which is set up with higher specs.
- 

### TODO:
- Maintain steps.txt as you figure it out
- Find all locations where user input are required
    - identify
    - test w toy set
    - create single read file
    - integrate read file
    - read file formatting and input guide
- Identify formatting code
    - find
    - update to row only (long): For every splice site it has all of the information in different columns, we want it to be in long form where every piece of information is on its own line (just a ton of rows).
- Identify outdated packages
	- locations
	- replacements
	- testing
- Hoffman
    - Transfer all work to project-guillom directory
