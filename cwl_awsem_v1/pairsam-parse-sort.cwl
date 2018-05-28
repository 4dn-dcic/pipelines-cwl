cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v42.1
inputs:
  bam:
    type: File?
    inputBinding:
      position: 1
      separate: true
  chromsize:
    type: File?
    inputBinding:
      position: 2
      separate: true
  outdir:
    type: string?
    default: .
    inputBinding:
      position: 3
      separate: true
  outprefix:
    type: string?
    default: out
    inputBinding:
      position: 4
      separate: true
  Threads:
    type: int
    default: 8
    inputBinding:
      position: 5
      separate: true
  compress_programm:
    type: string?
    default: lz4c
    inputBinding:
      position: 6
      separate: true
baseCommand: run-pairsam-parse-sort.sh
outputs:
  sorted_pairsam:
    type: File?
    outputBinding:
      glob: $(inputs.outprefix + '.sam.pairs.gz')

