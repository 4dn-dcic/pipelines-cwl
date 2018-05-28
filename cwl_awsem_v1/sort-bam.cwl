cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/sort-bam:v1
inputs:
  input_bam:
    type: File?
    inputBinding:
      position: 1
      separate: true
  prefix:
    type: string?
    default: out
    inputBinding:
      position: 2
      separate: true
baseCommand: run.sh
outputs:
  out_sorted_bam:
    type: File?
    outputBinding:
      glob: '*.sorted.bam'
  out_sorted_bam_index:
    type: File?
    outputBinding:
      glob: '*.sorted.bam.bai'

