cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-repliseq:v13
inputs:
  input_fastq:
    type: File
    inputBinding:
      position: 1
      separate: true
  outprefix:
    type: string
    default: out
    inputBinding:
      position: 2
      separate: true
  outdir:
    type: string
    default: .
    inputBinding:
      position: 1
      separate: true
baseCommand: clip
outputs:
  out_clipped_fastq:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.clip.fastq')
  out_log:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.clip.fastq.log')

