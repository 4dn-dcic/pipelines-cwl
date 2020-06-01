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
      id: "#input_fastq"
      inputBinding: 
        position: 1
        prefix: "-1"
        separate: true
    - 
      type: 
        - "File"
        - "null"
      id: "#input_fastq2"
      inputBinding: 
        position: 2
        prefix: "-2"
        separate: true
    - 
      type: 
        - "string"
      id: "#outprefix"
      inputBinding: 
        position: 3
        prefix: "-o"
        separate: true
      default: "out"
    - 
      type: 
        - "string"
      id: "#outdir"
      inputBinding: 
        position: 4
        prefix: "-O"
        separate: true
      default: "."
  outputs: 
    - 
      type: 
        - "File"
      id: "#out_clipped_fastq"
      outputBinding: 
        glob: "$(inputs.outdir + '/' + inputs.outprefix + '.R1.clip.fastq')"
    - 
      type: 
        - "File"
        - "null"
      id: "#out_clipped_fastq2"
      outputBinding: 
        glob: "$(inputs.outdir + '/' + inputs.outprefix + '.R2.clip.fastq')"
    - 
      type: 
        - "File"
      id: "#out_log"
      outputBinding: 
        glob: "$(inputs.outdir + '/' + inputs.outprefix + '.R1.clip.fastq.log')"
    - 
      type: 
        - "File"
        - "null"
      id: "#out_log2"
      outputBinding: 
        glob: "$(inputs.outdir + '/' + inputs.outprefix + '.R2.clip.fastq.log')"
  baseCommand: 
    - "run-clip.sh"
  requirements: 
    - 
      class: "InlineJavascriptRequirement"
  cwlVersion: "v1.0"

