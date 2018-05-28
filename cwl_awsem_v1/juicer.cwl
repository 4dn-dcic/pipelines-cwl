cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v35
inputs:
  input_fastq1:
    type: File?
    inputBinding:
      position: 1
      separate: true
  input_fastq2:
    type: File?
    inputBinding:
      position: 2
      separate: true
  bwaIndex:
    type: File?
    inputBinding:
      position: 3
      separate: true
  reference_fasta:
    type: File?
    inputBinding:
      position: 4
      separate: true
  chromsizes_file:
    type: File?
    inputBinding:
      position: 5
      separate: true
  restriction_file:
    type: File?
    inputBinding:
      position: 6
      separate: true
  outdir:
    type: string?
    default: .
    inputBinding:
      position: 8
      separate: true
  ncores:
    type: int?
    default: 8
    inputBinding:
      position: 7
      separate: true
baseCommand: run-juicer.sh
outputs:
  merged_nodups:
    type: File?
    outputBinding:
      glob: $(inputs.outdir + '/data_dir/aligned/merged_nodups.txt')

