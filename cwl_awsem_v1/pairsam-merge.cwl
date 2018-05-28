cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v42.1
inputs:
  outprefix:
    type: string?
    default: out
    inputBinding:
      position: 1
      separate: true
  nThreads:
    type: int
    default: 8
    inputBinding:
      position: 2
      separate: true
  input_pairsams:
    type: File[]?
    inputBinding:
      position: 3
      itemSeparator: ' '
      separate: true
baseCommand: run-pairsam-merge.sh
outputs:
  merged_pairsam:
    type: File?
    outputBinding:
      glob: $(inputs.outprefix + '.merged.sam.pairs.gz')

