cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v42.1
inputs:
  input_pairs:
    type: File
    inputBinding:
      position: 1
      prefix: -i
      separate: true
  chromsizes:
    type: File
    inputBinding:
      position: 2
      prefix: -c
      separate: true
  output_prefix:
    type: string
    default: out
    inputBinding:
      position: 3
      prefix: -o
      separate: true
  min_res:
    type: int
    default: 5000
    inputBinding:
      position: 4
      prefix: -r
      separate: true
  higlass:
    type: boolean
    default: false
    inputBinding:
      position: 5
      prefix: -g
      separate: true
  maxmem:
    type: string
    default: 14g
    inputBinding:
      position: 6
      prefix: -m
      separate: true
  mapqfilter:
    type: int
    default: 0
    inputBinding:
      position: 7
      prefix: -q
      separate: true
  custom_res:
    type: string
    default: ''
    inputBinding:
      position: 8
      prefix: -u
      separate: true
  no_balance:
    type: boolean
    default: false
    inputBinding:
      position: 9
      prefix: -B
      separate: true
baseCommand: run-juicebox-pre.sh
outputs:
  hic:
    type: File
    outputBinding:
      glob: '*.hic'

