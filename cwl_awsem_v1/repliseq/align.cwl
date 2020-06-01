---
  hints: 
    - 
      dockerPull: "duplexa/4dn-repliseq:v16"
      class: "DockerRequirement"
  arguments: []
  class: "CommandLineTool"
  inputs: 
    - 
      type: 
        - "File"
      id: "#fastq1"
      inputBinding: 
        position: 1
        prefix: "-1"
        separate: true
    - 
      type: 
        - "File"
        - "null"
      id: "#fastq2"
      inputBinding: 
        position: 2
        prefix: "-2"
        separate: true
    - 
      type: 
        - "File"
      id: "#bwa_index"
      inputBinding: 
        position: 3
        prefix: "-I"
        separate: true
    - 
      type: 
        - "int"
      id: "#nThreads"
      inputBinding: 
        position: 4
        prefix: "-p"
        separate: true
      default: 4
    - 
      type: 
        - "string"
      id: "#prefix"
      inputBinding: 
        position: 5
        prefix: "-o"
        separate: true
      default: "out"
    - 
      type: 
        - "string"
      id: "#outdir"
      inputBinding: 
        position: 6
        prefix: "-O"
        separate: true
      default: "."
  outputs: 
    - 
      type: 
        - "File"
      id: "#out_bam"
      outputBinding: 
        glob: "*.bam"
  baseCommand: 
    - "run-align.sh"
  requirements: 
    - 
      class: "InlineJavascriptRequirement"
  cwlVersion: "v1.0"

