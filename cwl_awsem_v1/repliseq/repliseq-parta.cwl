cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  fastq:
    type: File
    fdn_format: fastq
  bwaIndex:
    type: File
    fdn_format: bwaIndex
  chromsizes:
    type: File
    fdn_format: chromsizes
  nthreads:
    type: int
    default: 4
  memperthread:
    type: string
    default: 2G
  winsize:
    type: int
    default: 5000
steps:
  clip:
    run: clip.cwl
    fdn_step_meta:
      software_used:
      - cutadapt_1.14
      - repli-seq-pipeline_74bb1d
      description: Adapter removal according to the Repli-seq pipeline
      analysis_step_types:
      - adapter removal
    out:
    - out_clipped_fastq
    in:
      input_fastq:
        fdn_format: fastq
        source: fastq
        fdn_type: data file
        fdn_cardinality: single
  align:
    run: align.cwl
    fdn_step_meta:
      software_used:
      - bwa_0.7.15
      - repli-seq-pipeline_74bb1d
      description: Alignment according to the Repli-seq pipeline
      analysis_step_types:
      - alignment
    out:
    - out_bam
    in:
      fastq1:
        fdn_format: fastq
        source: clip/out_clipped_fastq
        fdn_cardinality: single
      bwa_index:
        fdn_format: bwaIndex
        source: bwaIndex
        fdn_type: reference file
        fdn_cardinality: single
      nThreads:
        source: nthreads
        fdn_type: parameter
        fdn_cardinality: single
  filtersort:
    run: filtersort.cwl
    fdn_step_meta:
      software_used:
      - samtools_1.4
      - repli-seq-pipeline_74bb1d
      description: Filtering and sorting according to the Repli-seq pipeline
      analysis_step_types:
      - filtering
      - sorting
    out:
    - out_filtered_sorted_bam
    in:
      input_bam:
        fdn_format: bam
        source: align/out_bam
        fdn_cardinality: single
      nthreads:
        source: nthreads
        fdn_type: parameter
        fdn_cardinality: single
      memperthread:
        source: memperthread
        fdn_type: parameter
        fdn_cardinality: single
  dedup:
    run: dedup.cwl
    fdn_step_meta:
      software_used:
      - samtools_1.4
      - repli-seq-pipeline_74bb1d
      description: PCR Duplicate removal according to the Repli-seq pipeline
      analysis_step_types:
      - duplicate removal
    out:
    - out_deduped_bam
    - out_qc_report
    in:
      input_bam:
        fdn_format: bam
        source: filtersort/out_filtered_sorted_bam
        fdn_cardinality: single
  count:
    run: count.cwl
    fdn_step_meta:
      software_used:
      - bedtools_2.26.0
      - repli-seq-pipeline_74bb1d
      - pairix_0.3.5
      - bedGraphToBigWig_v302.1.0
      description: Read aggregation according to the Repli-seq pipeline
      analysis_step_types:
      - binning
      - aggregation
    out:
    - out_count_bg
    in:
      input_bam:
        fdn_format: bam
        source: dedup/out_deduped_bam
        fdn_type: data file
        fdn_cardinality: single
      chrsizes:
        fdn_format: chromsize
        source: chromsizes
        fdn_type: reference file
        fdn_cardinality: single
      winsize:
        source: winsize
        fdn_type: parameter
        fdn_cardinality: single
outputs:
  filtered_sorted_deduped_bam:
    type: File
    fdn_output_type: processed
    fdn_format: bam
    outputSource: dedup/out_deduped_bam
  dedup_qc_report:
    type: File
    fdn_output_type: QC
    outputSource: dedup/out_qc_report
  count_bg:
    type: File
    fdn_output_type: processed
    fdn_format: bg
    fdn_secondary_file_formats:
    - bg_px2
    - bw
    outputSource: count/out_count_bg
fdn_meta:
  category: align + filter + count
  data_types:
  - Repli-seq
  name: repliseq-parta
  title: Repli-seq data processing pipeline for alignment, filtering and counting
  doc: This is a subworkflow of the Repli-seq data processing pipeline. It takes a
    raw fastq file, aligns to the reference genome, performs filtering and reports
    read counts in a bedgraph (bg) format.
  workflow_type: Repli-seq data processing

