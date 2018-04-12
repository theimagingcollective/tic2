#!/usr/bin/env bash

# Aliases


alias cdas='cd $ACTIVE_PATH; lsreport_function'
alias cdb='cd $ACTIVE_BIDS_PATH; lsreport_function'
alias cdin='cd $ACTIVE_PATH/incoming; lsreport_function'
alias cdia='cd $ACTIVE_IMAGE_ANALYSIS_PATH; lsreport_function'
alias cdip='cd $ACTIVE_IMAGE_PROCESSING_PATH; lsreport_function'
alias cdipl='cd $ACTIVE_IMAGE_PROCESSING_PATH/logs; lsreport_function'
alias cdqc='cd $ACTIVE_MRIQC_PATH; lsreport_function'
alias cdqcl='cd $ACTIVE_MRIQC_PATH/logs; lsreport_function'
alias cdass='cd $ACTIVE_SCRIPTS_PATH; lsreport_function'

alias asp='echo; echo $ACTIVE_PATH; echo'
alias asi='active_study_info.sh'

alias bv='tic_bids_validator.sh'

# Common environment variables used for ACTIVE scripts and such.

export ACTIVE_HEUDICONV_PATTERN="{subject}/2*/*/*.DCM"


alias bps_fmriprep_bold="bps 'sub*/**/func/*bold*preproc.nii.gz\'"
alias bps_fmriprep_t1w="bps 'sub*/**/func/*T1w_preproc.nii.gz'"


function bps_fmriprep_t1w()
    {

    search_string='sub*/**/anat/*T1w_preproc.nii.gz'

    echo
    echo 'bps ' $search_string
    echo $PWD
    echo

    bids_processing_status.py $search_string
    }


function bps_fmriprep_bold()
    {

    search_string='sub*/**/func/*_preproc.nii.gz'

    echo
    echo 'bps ' $search_string
    echo $PWD
    echo

    bids_processing_status.py $search_string
    }



function sw()
{
    if study_switcher.py $@; then


        params=$@

        echo "$params" | grep -q "\-d"

        if [ $? -ne 0 ];then
            source $TIC_INIT_PATH/tic_study_switcher.sh

            echo
           echo '    ACTIVE_STUDY is now' $ACTIVE_STUDY
            echo
        fi
    fi
}