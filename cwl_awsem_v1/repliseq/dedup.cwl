cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-repliseq:v13
inputs:
  input_bam:
    type: File
    inputBinding:
      position: 1
      separate: true
  outprefix:
    type: string
    default: out
    inputBinding:
      position: 3
      separate: true
  outdir:
    type: string
    default: .
    inputBinding:
      position: 2
      separate: true
baseCommand: run-dedup.sh
outputs:
  out_deduped_bam:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.rmdup.bam')
  out_qc_report:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.rmdup.log.qc_report.zip')

