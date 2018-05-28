cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  fastq1: File
  fastq2: File
  bwa_index: File
  chrsizes: File?
  reference_fasta: File?
  restriction_file: File?
  ncores:
    type: int?
    default: 8
  nsplit:
    type: int?
    default: 100
  max_remove_mapq: int?
steps:
  juicer:
    run: juicer.cwl
    out:
    - merged_nodups
    in:
      input_fastq1: fastq1
      input_fastq2: fastq2
      bwaIndex: bwa_index
      reference_fasta: reference_fasta
      chromsizes_file: chrsizes
      restriction_file: restriction_file
      outdir: {}
      ncores: ncores
  juicer2pairs:
    run: juicer2pairs.cwl
    out:
    - out_pairs
    - out_pairs_px
    in:
      input_merged_nodups: juicer/merged_nodups
      chromsize: chrsizes
      nsplit: nsplit
      outprefix: {}
      max_remove_mapq: max_remove_mapq
outputs:
  out_pairs:
    type: File?
    outputSource: juicer2pairs/out_pairs
  out_pairs_index:
    type: File?
    outputSource: juicer2pairs/out_pairs_px
  merged_nodups:
    type: File?
    outputSource: juicer/merged_nodups

