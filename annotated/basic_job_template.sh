#### submit_job.sh START ####
#!/bin/bash
#$ -cwd
# error = Merged with joblog
#$ -o joblog.$JOB_ID
#$ -j y
## Edit the line below as needed:
-l h_rt=24:00:00,h_data=32G
## Modify the parallel environment
## and the number of cores as needed:
#$ -pe shared 1
# Email address to notify
#$ -M $USER@mail
# Notify when
#$ -m bea

# echo job info on joblog:
echo "Job $JOB_ID started on:   " `hostname -s`
echo "Job $JOB_ID started on:   " `date `
echo " "
echo ". /u/local/apps/anaconda/python2-4.2.0/etc/profile.d/conda.sh" >> ~/.bashrc
# load the job environment:
. /u/local/Modules/default/init/modules.sh
## Edit the line below as needed:
module load anaconda
conda activate py36
module load samtools
module load python/3.6.1

## substitute the command to run your code
## in the two lines below:
python /u/home/k/kevinh97/project-guillom/COMPASS_compare_splice_junctions_from_multiple_aligner_BAM_test.py

# echo job info on joblog:
echo "Job $JOB_ID ended on:   " `hostname -s`
echo "Job $JOB_ID ended on:   " `date `
echo " "
#### submit_job.sh STOP ####
