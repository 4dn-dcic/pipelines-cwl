cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v42.1
inputs:
  input_cool:
    type: File?
    inputBinding:
      position: 1
      prefix: -i
      separate: true
  ncores:
    type: int?
    default: 4
    inputBinding:
      position: 2
      prefix: -p
      separate: true
  chunksize:
    type: int?
    default: 10000000
    inputBinding:
      position: 4
      prefix: -c
      separate: true
  outprefix:
    type: string?
    default: out
    inputBinding:
      position: 3
      prefix: -o
      separate: true
  juicer_res:
    type: boolean
    default: false
    inputBinding:
      position: 5
      prefix: -j
      separate: true
  custom_res:
    type: string
    default: ''
    inputBinding:
      position: 6
      prefix: -u
      separate: true
  no_balance:
    type: boolean
    default: false
    inputBinding:
      position: 7
      prefix: -B
      separate: true
baseCommand: run-cool2multirescool.sh
outputs:
  mcool:
    type: File?
    outputBinding:
      glob: '*.multires.cool'

