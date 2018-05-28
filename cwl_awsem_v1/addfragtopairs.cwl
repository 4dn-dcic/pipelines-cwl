cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v42.1
inputs:
  input_pairs:
    type: File?
    inputBinding:
      position: 1
      separate: true
  restriction_file:
    type: File?
    inputBinding:
      position: 2
      separate: true
  outprefix:
    type: string?
    default: out
    inputBinding:
      position: 3
      separate: true
  donothing:
    type: boolean
    default: false
    inputBinding:
      position: 0
      prefix: '-0'
      separate: true
baseCommand: run-addfrag2pairs.sh
outputs:
  pairs_with_frags:
    type: File?
    secondaryFiles:
    - .px2
    outputBinding:
      glob: $(inputs.outprefix + '.ff.pairs.gz')

