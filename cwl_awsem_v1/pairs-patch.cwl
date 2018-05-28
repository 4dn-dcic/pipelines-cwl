cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v40
inputs:
  outprefix:
    type: string?
    default: out
    inputBinding:
      position: 2
      separate: true
  input_pairs:
    type: File?
    inputBinding:
      position: 1
      itemSeparator: ' '
      separate: true
baseCommand: run-pairs-patch.sh
outputs:
  out_pairs:
    type: File?
    secondaryFiles:
    - .px2
    outputBinding:
      glob: $(inputs.outprefix + '.pairs.gz')

