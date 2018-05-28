cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/hictool-fastq2bam:v3
inputs:
  input_fastq1:
    type: File
    inputBinding:
      position: 2
      separate: false
  input_fastq2:
    type: File
    inputBinding:
      position: 3
      separate: false
  output_dir:
    type: string?
    default: .
    inputBinding:
      position: 4
      valueFrom:
        engine: '#cwl-js-engine'
        class: Expression
        script: $job.inputs.output_dir || '.'
      separate: false
  bowtie_index:
    type: File?
    inputBinding:
      position: 1
      separate: false
baseCommand: preprocessing.sh
outputs:
  sorted_bam_pe:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/out_noDup.sort.bam')
  split_bam1:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/out_pair1.bam')
  split_bam2:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/out_pair2.bam')

