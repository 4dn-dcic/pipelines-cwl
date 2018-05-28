cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v42.1
inputs:
  input_pairsam:
    type: File?
    inputBinding:
      position: 1
      separate: true
  outprefix:
    type: string?
    default: out
    inputBinding:
      position: 2
      separate: true
  chromsize:
    type: File?
    inputBinding:
      position: 3
      separate: true
baseCommand: run-pairsam-filter.sh
outputs:
  lossless_bamfile:
    type: File?
    outputBinding:
      glob: $(inputs.outprefix + '.lossless.bam')
  filtered_pairs:
    type: File?
    secondaryFiles:
    - .px2
    outputBinding:
      glob: $(inputs.outprefix + '.dedup.pairs.gz')

