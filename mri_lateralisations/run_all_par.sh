#!/bin/bash
 
file_dir="/home/jovyan/neurodesktop-storage/fsl_course_data/seg_struc/vbm"
 
cd $file_dir
 
files=$(find . -type f -name 'con*.nii.gz')
 
for file in $files;
do
    id=${file:6:4}
    echo "Analyzing participants ${id}"
    echo "${file}"
 
    # Make new directories

 
    new_dir="sub-${id}/anat"
    mkdir -p $new_dir
    new_dir="${file_dir}/${new_dir}"
 
    new_file_name="sub-${id}_T1w.nii.gz"
    # Copy the file
    cp $file $new_file_name
 
    # Move the file to a newly created directory
    mv $new_file_name $new_dir
 
    cd $new_dir
    fsl_anat -i $new_file_name
    # Move back to the main directories
    cd $file_dir
done
