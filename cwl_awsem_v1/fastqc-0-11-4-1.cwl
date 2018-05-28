cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  input_fastq: File
  threads:
    doc: Specifies the number of files which can be processed simultaneously.  Each
      thread will be allocated 250MB of memory so you shouldn't run more threads than
      your available memory will cope with, and not more than 6 threads on a 32 bit
      machine.
    type: int?
    default: 1
steps:
  FastQC:
    run: fastqc-0-11-4.cwl
    out:
    - report_zip
    in:
      threads: threads
      outdir: {}
      input_fastq: input_fastq
outputs:
  report_zip:
    type: File?
    outputSource: FastQC/report_zip

