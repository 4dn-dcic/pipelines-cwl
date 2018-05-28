cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/4dn-hic:v32
inputs:
  input_fastq:
    doc: Input file.
    type: File
    inputBinding:
      position: 1
      itemSeparator:
      separate: true
  threads:
    doc: Specifies the number of files which can be processed simultaneously.  Each
      thread will be allocated 250MB of memory so you shouldn't run more threads than
      your available memory will cope with, and not more than 6 threads on a 32 bit
      machine.
    type: int?
    default: 1
    inputBinding:
      position: 2
      separate: true
  outdir:
    type: string?
    default: .
    inputBinding:
      position: 3
      separate: true
baseCommand: run-fastqc.sh
outputs:
  report_zip:
    doc: Zip archive of the report.
    type: File?
    outputBinding:
      glob: '*_fastqc.zip'

