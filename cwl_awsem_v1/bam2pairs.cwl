cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/bam2pairs:v1
inputs:
  input_bam:
    type: File
    inputBinding:
      position: 1
      separate: true
  out_prefix:
    type: string?
    default: out
    inputBinding:
      position: 2
      separate: true
baseCommand: run.sh
outputs:
  out_pairs:
    type: File?
    outputBinding:
      glob: '*.bsorted.pairs.gz'
  out_pairs_index:
    type: File?
    outputBinding:
      glob: '*.bsorted.pairs.gz.px2'

