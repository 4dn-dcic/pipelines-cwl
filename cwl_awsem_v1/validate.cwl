cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/validatefiles:v1
inputs:
  input_file:
    type: File?
    inputBinding:
      position: 1
      separate: true
  type:
    type:
    - 'null'
    - type: enum
      name: type
      symbols:
      - fastq
      - fasta
      - bam
    default: fastq
    inputBinding:
      position: 2
      separate: true
baseCommand:
- run.sh
- ''
outputs:
  report:
    type: File?
    outputBinding:
      glob: report_validatefiles

