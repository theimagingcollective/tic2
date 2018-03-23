#!/usr/bin/env bash

export SYNERGY_SCRIPTS_PATH=${TIC_PATH}/studies/synergy/scripts


export SYNERGY_PATH=/gandg/synergy/
export SYNERGY_BIDS_PATH=${SYNERGY_PATH}/bids
export SYNERGY_IMAGE_ANALYSIS_PATH=${SYNERGY_PATH}/image_analysis
export SYNERGY_IMAGE_PROCESSING_PATH=${SYNERGY_PATH}/image_processing
export SYNERGY_IMAGE_PROCESSING_LOG_PATH=${SYNERGY_IMAGE_PROCESSING_PATH}/logs

export SYNERGY_QC_PATH=${SYNERGY_PATH}/qc
export SYNERGY_MRIQC_PATH=${SYNERGY_QC_PATH}/mriqc

export SYNERGY_FMRIPREP_PATH=${SYNERGY_IMAGE_PROCESSING_PATH}/fmriprep
export SYNERGY_NETPREP_PATH=${SYNERGY_IMAGE_PROCESSING_PATH}/netprep


export SYNERGY_BIDS_CONFIG_FILE=${SYNERGY_SCRIPTS_PATH}/syn_bids.cfg
export SYNERGY_HEUDICONV_PROTOCOL=${SYNERGY_SCRIPTS_PATH}/synergy_protocol.py
export SYNERGY_CLEAN_BIDS=${HFPEF_SCRIPTS_PATH}/synergy_clean_bids.sh

export SYNERGY_SUBJECTS_DIR=${SYNERGY_IMAGE_PROCESSING_PATH}/freesurfer

export SYNERGY_SINGULARITY_USER_BIND_PATHS="/gandg"

export IMOVE_HFPEF_REGEX="syn[0-9]{3}"
