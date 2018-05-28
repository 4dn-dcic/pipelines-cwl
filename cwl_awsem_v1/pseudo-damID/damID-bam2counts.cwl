cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  bams:
    type: File[]
    fdn_format: bam
steps:
  count:
    run: ''
    fdn_step_meta:
      description: Counting
      analysis_step_types:
      - counting
    out:
    - count_5kb
    - count_10kb
    - count_20kb
    - count_40kb
    - count_80kb
    - count_160kb
    in:
      bams:
        fdn_format: bam
        source: bams
        fdn_type: data file
        fdn_cardinality: array
outputs:
  count_5kb:
    type: File
    fdn_format: bw
    fdn_output_type: processed
    outputSource: count/count_5kb
  count_10kb:
    type: File
    fdn_format: bw
    fdn_output_type: processed
    outputSource: count/count_10kb
  count_20kb:
    type: File
    fdn_format: bw
    fdn_output_type: processed
    outputSource: count/count_20kb
  count_40kb:
    type: File
    fdn_format: bw
    fdn_output_type: processed
    outputSource: count/count_40kb
  count_80kb:
    type: File
    fdn_format: bw
    fdn_output_type: processed
    outputSource: count/count_80kb
  count_160kb:
    type: File
    fdn_format: bw
    fdn_output_type: processed
    outputSource: count/count_160kb
fdn_meta:
  category: counting
  data_types:
  - DAM-ID Seq
  name: dam-id-processing-pseudo-bam2counts
  title: Pseudo Workflow for DamID-seq
  doc: This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a
    list of bam files and creates a list of count files
  workflow_type: DamID Seq data analysis

