#!/usr/bin/env bash


BIDS_APP=fmriprep

ACTIVE_APP_OUTPUT_PATH=$ACTIVE_IMAGE_PROCESSING_PATH
APP_SINGULARITY_IMAGE=$FMRIPREP_SINGULARITY_IMAGE

ACTIVE_APP_WORKING_PATH=$ACTIVE_APP_OUTPUT_PATH/_working

# Convert to lower case
study_prefix=$(echo "${ACTIVE_STUDY,,}")

# create the output and work directories parallel to BIDS hierarchy, not inside it

datetime_stamp=`date '+d%Y%m%d_%H:%M:%S'`
log_file=${ACTIVE_IMAGE_PROCESSING_LOG_PATH}/${study_prefix}_${BIDS_APP}_${datetime_stamp}.log

echo ' ' | tee log_file
echo 'datetime.now()         = ' $(date) | tee log_file
echo 'active study           = ' $ACTIVE_STUDY | tee log_file
echo 'bids app               = ' $BIDS_APP | tee log_file
echo 'bids path              = ' $ACTIVE_BIDS_PATH | tee log_file
echo 'log path               = ' $ACTIVE_IMAGE_PROCESSING_LOG_PATH | tee log_file
echo 'output path            = ' $ACTIVE_APP_OUTPUT_PATH | tee log_file
echo 'working path           = ' $ACTIVE_APP_WORKING_PATH | tee log_file
echo 'SUBJECTS_DIR           = ' $SUBJECTS_DIR | tee log_file
echo 'app singularity image  = ' $APP_SINGULARITY_IMAGE | tee log_file
echo 'log file               = ' $log_file | tee log_file
echo ' ' | tee log_file

# NOTE: any -B mount points must exist in the container
#       run "sudo singularity shell -s xx.img"  and create the mount points

# https://askubuntu.com/questions/625224/how-to-redirect-stderr-to-a-file
# Redirect stdout to one file and stderr to another file:
#  command > out 2>error
#
# Redirect stderr to stdout (&1), and then redirect stdout to a file:
# command >out 2>&1
#
# Redirect both to a file:
# command &> out

nohup time /usr/local/bin/singularity run -w -B /cenc -B /gandg -B /bkraft1 \
                 $APP_SINGULARITY_IMAGE \
                 $ACTIVE_BIDS_PATH \
                 $ACTIVE_APP_OUTPUT_PATH \
                 --work-dir $ACTIVE_APP_WORKING_PATH \
                 participant ${@} > $log_file 2>&1 &
