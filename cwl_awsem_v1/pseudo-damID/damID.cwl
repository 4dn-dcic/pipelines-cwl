cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  fastqs:
    type: File[]
    fdn_format: fastq
steps:
  trim-align:
    run: ''
    fdn_step_meta:
      description: Trimming and Aligning a set of fastq files
      analysis_step_types:
      - alignment
    out:
    - bam
    in:
      fastqs:
        fdn_format: fastq
        source: fastqs
        fdn_type: data file
        fdn_cardinality: array
  normalize:
    run: ''
    fdn_step_meta:
      description: Normalization
      analysis_step_types:
      - normalization
    out:
    - normalized_bed
    in:
      bam:
        fdn_format: bam
        source: trim-align/bam
        fdn_type: data file
        fdn_cardinality: single
  call-lad:
    run: ''
    fdn_step_meta:
      description: Calling LADs
      analysis_step_types:
      - LAD calling
    out:
    - lad_bed
    - track_bw
    - stats
    in:
      normalized_bed:
        fdn_format: bed
        source: normalize/normalized_bed
        fdn_type: data file
        fdn_cardinality: single
outputs:
  bam:
    type: File
    fdn_format: bam
    fdn_output_type: processed
    outputSource: trim-align/bam
  normalized_bed:
    type: File
    fdn_format: bed
    fdn_output_type: processed
    outputSource: normalize/normalized_bed
  LAD_bed:
    type: File
    fdn_format: bed
    fdn_output_type: processed
    outputSource: call-lad/lad_bed
  track_bw:
    type: File
    fdn_format: bw
    fdn_output_type: processed
    outputSource: call-lad/track_bw
  stats:
    type: File
    fdn_format: txt
    fdn_output_type: processed
    outputSource: call-lad/stats
fdn_meta:
  category: full pipeline
  data_types:
  - DAM-ID Seq
  name: dam-id-processing-pseudo
  title: Pseudo Workflow for DamID-seq
  doc: This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a
    list of fastq files and creates bam, normalized bed, LAD bed, track bw and stats
    file.
  workflow_type: DamID Seq data analysis

