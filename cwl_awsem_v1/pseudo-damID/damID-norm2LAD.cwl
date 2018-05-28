cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  norm_bw:
    type: File
    fdn_format: bw
steps:
  call-lad:
    run: ''
    fdn_step_meta:
      description: Calling LADs
      analysis_step_types:
      - lad-calling
    out:
    - lad
    - lad_states
    in:
      norm_bw:
        fdn_format: bw
        source: norm_bw
        fdn_type: data file
        fdn_cardinality: single
outputs:
  LAD:
    type: File
    fdn_format: bed
    fdn_output_type: processed
    outputSource: call-lad/lad
  LAD_states:
    type: File
    fdn_format: txt
    fdn_output_type: processed
    outputSource: call-lad/lad_states
fdn_meta:
  category: LAD calling
  data_types:
  - DAM-ID Seq
  name: dam-id-processing-pseudo-norm2LAD
  title: Pseudo Workflow for DamID-seq
  doc: This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a
    normalized bw file and creates a LAD bed file and a LAD state txt file.
  workflow_type: DamID Seq data analysis

