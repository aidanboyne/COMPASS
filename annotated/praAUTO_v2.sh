#!/bin/bash

#### praAUTO.sh START ####

#Place in same directory as process_reads_and_align.sh
#Run using bash praAUTO.sh after you have loaded reference genome and SRR sample
#into appropriate folders (see https://github.com/aidanboyne/COMPASS)

echo "---Process Reads and Align Autorunner---\n"

#create path variables
home=/u/project/guillom/kevinh97/aidanb
modDirectory=/u/local/Modules/modulefiles

#process reads and align optargs
cDirectory=/u/project/guillom/kevinh97/aidanb/allData/
rDirectory=/u/project/guillom/kevinh97/aidanb/allData/ref/
sDirectory=SRR10480750_1
fDirectory=/u/project/guillom/kevinh97/aidanb/reference_genome/S288C_refseq 
gDirectory=/u/project/guillom/kevinh97/aidanb/allData/
aDirectory=/u/project/guillom/kevinh97/aidanb/kr_compass/jvarkit/src/main/java/com/github/lindenb/jvarkit/tools/samfixcigar/SamFixCigar.java

mkdir $rDirectory

echo "Paths created successfully...\n"
echo "Loading Job environment\n"

SCRIPTS="/u/project/guillom/kevinh97/aidanb/kr_compass"
cd $SCRIPTS
cd jvarkit
./gradlew samfixcigar

echo "Environment loaded...\n"
echo "Running Process Reads and Align\n"

#run: process reads and align
cd /u/project/guillom/kevinh97/aidanb/kr_compass
./process_reads_and_align.sh -C $cDirectory -R $rDirectory -S $sDirectory -F $fDirectory -G $gDirectory -A $aDirectory -M 20 -N 10000 -P 8 -L 20

#### praAUTO.sh STOP ####


#------------TODO-------------#
#DONE: Figure out how to properly load .yml file to get req. dependencies
#Create user input to assign min, max intron read length
#Find optimal threading, readlength, reads to process
#Create user input for above
#Create timer function
#Create required directories for PRA if not already existing using -C path


#Notes
#Must assign num threads