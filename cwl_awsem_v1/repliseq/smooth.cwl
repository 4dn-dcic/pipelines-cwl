cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-repliseq:v13
inputs:
  input_bg:
    type: File
    inputBinding:
      position: 4
      separate: true
  lspan:
    type: int
    default: 300000
    inputBinding:
      position: 1
      prefix: -l
      separate: true
  outprefix:
    type: string
    default: out
    inputBinding:
      position: 3
      prefix: -p
      separate: true
  outdir:
    type: string
    default: .
    inputBinding:
      position: 2
      prefix: -d
      separate: true
baseCommand: smooth
outputs:
  out_smooth_bg:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.loess' + inputs.lspan + '.bg')

