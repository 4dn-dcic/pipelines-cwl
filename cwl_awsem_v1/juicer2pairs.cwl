cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v35
inputs:
  input_merged_nodups:
    type: File?
    inputBinding:
      position: 3
      separate: true
  chromsize:
    type: File?
    inputBinding:
      position: 4
      separate: true
  nsplit:
    type: int?
    default: 100
    inputBinding:
      position: 1
      prefix: -s
      separate: true
  outprefix:
    type: string?
    default: out
    inputBinding:
      position: 5
      separate: true
  max_remove_mapq:
    type: int?
    inputBinding:
      position: 2
      prefix: -m
      separate: true
baseCommand: merged_nodup2pairs.pl
outputs:
  out_pairs:
    type: File?
    outputBinding:
      glob: '*.bsorted.pairs.gz'
  out_pairs_px:
    type: File?
    outputBinding:
      glob: '*.bsorted.pairs.gz.px2'

