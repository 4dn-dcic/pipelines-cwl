cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-repliseq:v13
inputs:
  input:
    type: File
    inputBinding:
      position: 1
      separate: true
  reference_bg:
    type: File
    inputBinding:
      position: 2
      separate: true
  outprefix:
    type: string
    default: out
    inputBinding:
      position: 4
      separate: true
  outdir:
    type: string
    default: .
    inputBinding:
      position: 3
      separate: true
baseCommand: normalize
outputs:
  out_norm_bg:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.qnorm.bg')

