---
  class: "Workflow"
  fdn_meta: 
    title: "Pseudo Workflow for DamID-seq"
    name: "dam-id-processing-pseudo"
    data_types: 
      - "DAM-ID Seq"
    category: "full pipeline"
    workflow_type: "DamID Seq data analysis"
    description: "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a list of fastq files and creates bam, normalized bed, LAD bed, track bw and stats file."
  inputs: 
    - 
      id: "#fastqs"
      type: 
        - 
          type: "array"
          items: "File"
      fdn_format: "fastq"
  outputs: 
    - 
      id: "#bam"
      type: 
        - "File"
      source: "#trim-align.bam"
      fdn_format: "bam"
      fdn_output_type: "processed"
    - 
      id: "#normalized_bed"
      type: 
        - "File"
      source: "#normalize.normalized_bed"
      fdn_format: "bed"
      fdn_output_type: "processed"
    - 
      id: "#LAD_bed"
      type: 
        - "File"
      source: "#call-lad.lad_bed"
      fdn_format: "bed"
      fdn_output_type: "processed"
    - 
      id: "#track_bw"
      type: 
        - "File"
      source: "#call-lad.track_bw"
      fdn_format: "bw"
      fdn_output_type: "processed"
    - 
      id: "#stats"
      type: 
        - "File"
      source: "#call-lad.stats"
      fdn_format: "txt"
      fdn_output_type: "processed"
  cwlVersion: "draft-3"
  steps: 
    - 
      fdn_step_meta: 
        description: "Trimming and Aligning a set of fastq files"
        analysis_step_types: 
          - "alignment"
      outputs: 
        - 
          id: "#trim-align.bam"
          fdn_format: "bam"
          fdn_cardinality: "single"
          fdn_type: "data file"
      inputs: 
        - 
          id: "#trim-align.fastqs"
          source: "#fastqs"
          fdn_format: "fastq"
          fdn_cardinality: "array"
          fdn_type: "data file"
      run: ""
      id: "#trim-align"
    - 
      fdn_step_meta: 
        description: "Normalization"
        analysis_step_types: 
          - "normalization"
      outputs: 
        - 
          id: "#normalize.normalized_bed"
          fdn_format: "bed"
          fdn_cardinality: "single"
          fdn_type: "data file"
      inputs: 
        - 
          id: "#normalize.bam"
          source: "#trim-align.bam"
          fdn_format: "bam"
          fdn_cardinality: "single"
          fdn_type: "data file"
      run: ""
      id: "#normalize"
    - 
      fdn_step_meta: 
        description: "Calling LADs"
        analysis_step_types: 
          - "LAD calling"
      outputs: 
        - 
          id: "#call-lad.lad_bed"
          fdn_format: "bed"
          fdn_cardinality: "single"
          fdn_type: "data file"
        - 
          id: "#call-lad.track_bw"
          fdn_format: "bw"
          fdn_cardinality: "single"
          fdn_type: "data file"
        - 
          id: "#call-lad.stats"
          fdn_format: "txt"
          fdn_cardinality: "single"
          fdn_type: "data file"
      inputs: 
        - 
          id: "#call-lad.normalized_bed"
          source: "#normalize.normalized_bed"
          fdn_format: "bed"
          fdn_cardinality: "single"
          fdn_type: "data file"
      run: ""
      id: "#call-lad"
  requirements: 
    - 
      class: "InlineJavascriptRequirement"
