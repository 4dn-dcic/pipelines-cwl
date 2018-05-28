cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-repliseq:v13
inputs:
  outdir:
    type: string
    default: .
    inputBinding:
      position: 1
      separate: true
  outprefix:
    type: string
    default: out
    inputBinding:
      position: 2
      separate: true
  input_bgs:
    type: File[]
    inputBinding:
      position: 3
      itemSeparator: ' '
      separate: true
baseCommand: make_referencebg
outputs:
  out_reference_bg:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.inorm.bg')

