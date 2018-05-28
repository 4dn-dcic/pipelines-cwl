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
  min_rpkm:
    type: float
    default: 0.1
    inputBinding:
      position: 3
      separate: true
  input_bgs:
    type: File[]
    inputBinding:
      position: 4
      itemSeparator: ' '
      separate: true
baseCommand: make_filteredbed
outputs:
  out_filtered_bed:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.filtered.bed')

