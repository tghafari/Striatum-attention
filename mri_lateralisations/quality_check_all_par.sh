#!/bin/bash
 
file_dir="/home/jovyan/neurodesktop-storage/fsl_course_data/seg_struc/vbm"
 
cd $file_dir
 
for dir in "$file_dir"/sub*/;

do

    if [ -d "$dir" ]; then

        echo "$dir"

        id="${dir: -9:8}"

        # Find the original data

        origfile_dir="${dir}anat"

        cd $origfile_dir

        origfile="${id}_T1w.nii.gz"
 
        # Copy the original file to the segmentation folder

        result_dir="${dir}anat/${id}_T1w.anat/first_results"

        cp $origfile $result_dir
 
        cd $result_dir
 
        quality_file="T1_first_all_fast_firstseg.nii.gz"
 
        # Perform quality check

        first_roi_slicesdir $origfile $quality_file

        cd $file_dir
 
    fi

done