cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-repliseq:v13
inputs:
  input_bam:
    type: File
    inputBinding:
      position: 1
      separate: true
  chrsizes:
    type: File
    inputBinding:
      position: 2
      separate: true
  winsize:
    type: int
    default: 5000
    inputBinding:
      position: 5
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
baseCommand: run-count.sh
outputs:
  out_count_bg:
    type: File
    secondaryFiles:
    - ^^.bw
    - .px2
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.w' + inputs.winsize + '.bedGraph.gz')

