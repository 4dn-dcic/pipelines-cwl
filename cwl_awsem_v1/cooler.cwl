cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v42.1
inputs:
  pairs:
    type: File?
    secondaryFiles:
    - $(self.basename + '.px2')
    inputBinding:
      position: 1
      separate: true
  chrsizes:
    type: File?
    inputBinding:
      position: 2
      separate: true
  binsize:
    type: int?
    inputBinding:
      position: 3
      separate: true
  outprefix:
    type: string?
    default: out
    inputBinding:
      position: 5
      separate: true
  ncores:
    type: int?
    default: 8
    inputBinding:
      position: 4
      separate: true
  max_split:
    type: int?
    default: 2
    inputBinding:
      position: 6
      separate: true
baseCommand: run-cooler.sh
outputs:
  cool:
    type: File?
    outputBinding:
      glob: '*.cool'

