cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v42.1
inputs:
  mcool:
    type: File
    inputBinding:
      position: 1
      prefix: -i
      separate: true
  chromsize:
    type: File
    inputBinding:
      position: 2
      prefix: -c
      separate: true
  outdir:
    type: string
    default: .
    inputBinding:
      position: 3
      prefix: -d
      separate: true
  output_prefix:
    type: string
    default: out
    inputBinding:
      position: 4
      prefix: -o
      separate: true
  custom_res:
    type: string
    default: 1000,2000,5000,10000,25000,50000,100000,250000,500000,1000000,2500000,5000000,10000000
    inputBinding:
      position: 5
      prefix: -u
      separate: true
baseCommand: run-mcool2hic.sh
outputs:
  cooler_normvector:
    type: File?
    outputBinding:
      glob: '*.juicerformat.gz'

