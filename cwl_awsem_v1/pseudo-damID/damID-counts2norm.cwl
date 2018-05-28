cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  count_data:
    type: File
    fdn_format: bw
  count_control:
    type: File
    fdn_format: bw
steps:
  normalize:
    run: ''
    fdn_step_meta:
      description: Normalization
      analysis_step_types:
      - normalization
    out:
    - norm_bw
    in:
      count_data:
        fdn_format: bw
        source: count_data
        fdn_type: data file
        fdn_cardinality: single
      count_control:
        fdn_format: bw
        source: count_control
        fdn_type: data file
        fdn_cardinality: single
outputs:
  norm_bw:
    type: File
    fdn_format: bw
    fdn_output_type: processed
    outputSource: normalize/norm_bw
fdn_meta:
  category: full pipeline
  data_types:
  - DAM-ID Seq
  name: dam-id-processing-pseudo-counts2norm
  title: Pseudo Workflow for DamID-seq
  doc: This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a
    list of fastq files and creates bam, normalized bed, LAD bed, track bw and stats
    file.
  workflow_type: DamID Seq data analysis

