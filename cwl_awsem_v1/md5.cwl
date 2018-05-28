cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/md5:v2
inputs:
  input_file:
    type: File?
    inputBinding:
      position: 1
      separate: true
baseCommand: run.sh
outputs:
  report:
    type: File?
    outputBinding:
      glob: report

