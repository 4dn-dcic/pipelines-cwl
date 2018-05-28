cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  input_fastq2: File
  input_fastq1: File
  bowtie_index: File?
  RE_bed: File?
  chrlen_file: File?
  contact_matrix_binsize: int
  chromosome: string[]
steps:
  hictool_fastq2bam:
    run: fastq2bam.cwl
    out:
    - split_bam2
    - split_bam1
    - sorted_bam_pe
    in:
      output_dir: {}
      input_fastq2: input_fastq2
      input_fastq1: input_fastq1
      bowtie_index: bowtie_index
  hictool_bam2hdf5:
    run: bam2hdf5.cwl
    out:
    - fend_object_hdf5
    - HiC_project_object_hdf5
    - HiC_norm_binning_hdf5
    - HiC_distance_function_hdf5
    - HiC_data_object_hdf5
    in:
      output_dir: {}
      input_bam2: hictool_fastq2bam/split_bam2
      input_bam1: hictool_fastq2bam/split_bam1
      RE_bed: RE_bed
  hictool_hdf52matrix:
    run: bam2matrix2.cwl
    scatter: chromosome
    out:
    - observed_contact_matrix
    - normalized_fend_contact_matrix
    - normalized_enrich_contact_matrix
    - expected_fend_contact_matrix
    - expected_enrich_contact_matrix
    in:
      output_dir: {}
      fend_object_hdf5: hictool_bam2hdf5/fend_object_hdf5
      contact_matrix_binsize: contact_matrix_binsize
      chromosome: chromosome
      chrlen_file: chrlen_file
      HiC_norm_binning_hdf5: hictool_bam2hdf5/HiC_norm_binning_hdf5
      HiC_data_object_hdf5: hictool_bam2hdf5/HiC_data_object_hdf5
outputs:
  sorted_bam_pe:
    type: File?
    outputSource: hictool_fastq2bam/sorted_bam_pe
  HiC_project_object_hdf5:
    type: File?
    outputSource: hictool_bam2hdf5/HiC_project_object_hdf5
  HiC_distance_function_hdf5:
    type: File?
    outputSource: hictool_bam2hdf5/HiC_distance_function_hdf5
  normalized_fend_contact_matrix:
    type: File?
    outputSource: hictool_hdf52matrix/normalized_fend_contact_matrix
  normalized_enrich_contact_matrix:
    type: File?
    outputSource: hictool_hdf52matrix/normalized_enrich_contact_matrix
  expected_enrich_contact_matrix:
    type: File?
    outputSource: hictool_hdf52matrix/expected_enrich_contact_matrix
  split_bam2:
    type: File?
    outputSource: hictool_fastq2bam/split_bam2
  split_bam1:
    type: File?
    outputSource: hictool_fastq2bam/split_bam1
  fend_object_hdf5:
    type: File?
    outputSource: hictool_bam2hdf5/fend_object_hdf5
  HiC_norm_binning_hdf5:
    type: File?
    outputSource: hictool_bam2hdf5/HiC_norm_binning_hdf5
  HiC_data_object_hdf5:
    type: File?
    outputSource: hictool_bam2hdf5/HiC_data_object_hdf5
  observed_contact_matrix:
    type: File?
    outputSource: hictool_hdf52matrix/observed_contact_matrix
  expected_fend_contact_matrix:
    type: File?
    outputSource: hictool_hdf52matrix/expected_fend_contact_matrix

