cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-repliseq:v13
inputs:
  fastq1:
    type: File
    inputBinding:
      position: 1
      separate: true
  bwa_index:
    type: File
    inputBinding:
      position: 2
      separate: true
  nThreads:
    type: int
    default: 4
    inputBinding:
      position: 5
      separate: true
  prefix:
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
baseCommand: run-align.sh
outputs:
  out_bam:
    type: File
    outputBinding:
      glob: '*.bam'

