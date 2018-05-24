---
  class: "Workflow"
  fdn_meta: 
    title: "Pseudo Workflow for DamID-seq"
    name: "dam-id-processing-pseudo-combine-norm"
    data_types: 
      - "DAM-ID Seq"
    category: "Merging"
    workflow_type: "DamID Seq data analysis"
    description: "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a list of fastq files and creates bam, normalized bed, LAD bed, track bw and stats file."
  inputs: 
    - 
      id: "#norm_bws"
      type: 
        - 
          type: "array"
          items: "File"
      fdn_format: "bw"
  outputs: 
    - 
      id: "#combined_norm_bw"
      type: 
        - "File"
      source: "#combine.combined_norm_bw"
      fdn_format: "bw"
      fdn_output_type: "processed"
  cwlVersion: "draft-3"
  steps: 
    - 
      fdn_step_meta: 
        description: "Combine norm.bw"
        analysis_step_types: 
          - "merging"
      outputs: 
        - 
          id: "#combine.combined_norm_bw"
          fdn_format: "bw"
          fdn_cardinality: "single"
          fdn_type: "data file"
      inputs: 
        - 
          id: "#combine.norm_bws"
          source: "#norm_bws"
          fdn_format: "bw"
          fdn_cardinality: "array"
          fdn_type: "data file"
      run: ""
      id: "#combine"
  requirements: 
    - 
      class: "InlineJavascriptRequirement"
