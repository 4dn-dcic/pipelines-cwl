cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v42.1
inputs:
  input_hic:
    type: File?
    inputBinding:
      position: 1
      separate: true
  input_mcool:
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
baseCommand: run-add-hicnormvector-to-mcool.sh
outputs:
  mcool_with_hicnorm:
    type: File?
    outputBinding:
      glob: $(inputs.outdir + '/' + '*.mcool')

