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
      position: 1
      separate: true
  filtered_bed:
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
baseCommand: filter
outputs:
  out_filtered_bg:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.filtered.bg')

