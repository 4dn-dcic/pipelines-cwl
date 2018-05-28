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
    secondaryFiles:
    - .px2
    inputBinding:
      position: 1
      separate: true
    fdn_secondary_file_formats:
    - pairs_px2
  chromsizes:
    type: File
    inputBinding:
      position: 2
      separate: true
  sample_name:
    type: string
    inputBinding:
      position: 3
      separate: true
  enzyme:
    type:
      type: enum
      name: enzyme
      symbols:
      - '4'
      - '6'
    inputBinding:
      position: 4
      separate: true
  output_dir:
    type: string
    default: .
    inputBinding:
      position: 5
      separate: true
baseCommand: run-pairsqc-single.sh
outputs:
  report:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/*report.zip')

