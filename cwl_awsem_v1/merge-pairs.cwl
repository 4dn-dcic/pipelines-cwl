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
  input_pairs:
    type: File[]?
    inputBinding:
      position: 2
      itemSeparator: ' '
      separate: true
baseCommand: run-merge-pairs.sh
outputs:
  merged_pairs:
    type: File?
    secondaryFiles:
    - .px2
    outputBinding:
      glob: $(inputs.outprefix + '.pairs.gz')

