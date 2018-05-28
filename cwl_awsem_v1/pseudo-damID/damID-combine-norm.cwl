cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  norm_bws:
    type: File[]
    fdn_format: bw
steps:
  combine:
    run: ''
    fdn_step_meta:
      description: Combine norm.bw
      analysis_step_types:
      - merging
    out:
    - combined_norm_bw
    in:
      norm_bws:
        fdn_format: bw
        source: norm_bws
        fdn_type: data file
        fdn_cardinality: array
outputs:
  combined_norm_bw:
    type: File
    fdn_format: bw
    fdn_output_type: processed
    outputSource: combine/combined_norm_bw
fdn_meta:
  category: Merging
  data_types:
  - DAM-ID Seq
  name: dam-id-processing-pseudo-combine-norm
  title: Pseudo Workflow for DamID-seq
  doc: This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a
    list of fastq files and creates bam, normalized bed, LAD bed, track bw and stats
    file.
  workflow_type: DamID Seq data analysis

