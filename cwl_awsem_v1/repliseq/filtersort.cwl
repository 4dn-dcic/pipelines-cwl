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
  nthreads:
    type: int
    default: 1
    inputBinding:
      position: 3
      separate: true
  memperthread:
    type: string
    default: 5G
    inputBinding:
      position: 2
      separate: true
  outprefix:
    type: string
    default: out
    inputBinding:
      position: 5
      separate: true
  outdir:
    type: string
    default: .
    inputBinding:
      position: 4
      separate: true
baseCommand: filtersort
outputs:
  out_filtered_sorted_bam:
    type: File
    outputBinding:
      glob: $(inputs.outdir + '/' + inputs.outprefix + '.q20_sort.bam')

