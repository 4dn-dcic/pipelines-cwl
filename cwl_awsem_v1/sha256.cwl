cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/sha256:v1
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
      glob: '"report"'
      loadContents: true

