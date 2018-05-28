cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-repliseq:v13
inputs:
  input_ebg:
    type: File
    inputBinding:
      position: 1
      separate: true
  input_lbg:
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
baseCommand: log2ratio
outputs:
  out_log2ratio:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.l2r.out')

