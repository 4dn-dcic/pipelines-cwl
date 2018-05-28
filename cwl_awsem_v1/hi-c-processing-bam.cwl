cwlVersion: v1.0
class: Workflow
requirements:
  ScatterFeatureRequirement: {}
  InlineJavascriptRequirement: {}
inputs:
  input_bams:
    type: File[]
    fdn_format: bam
  chromsize:
    type: File
    fdn_format: chromsizes
  nthreads_parse_sort:
    type: int
    default: 8
  nthreads_merge:
    type: int
    default: 8
steps:
  pairsam-parse-sort:
    run: pairsam-parse-sort.cwl
    fdn_step_meta:
      software_used:
      - pairsamtools_eccd21
      description: Parsing and sorting bam file
      analysis_step_types:
      - annotation
      - sorting
    scatter: bam
    out:
    - sorted_pairsam
    in:
      bam:
        fdn_format: bam
        source: input_bams
      chromsize:
        fdn_format: chromsize
        source: chromsize
      Threads: nthreads_parse_sort
  pairsam-merge:
    run: pairsam-merge.cwl
    fdn_step_meta:
      software_used:
      - pairsamtools_eccd21
      description: Merging pairsam files
      analysis_step_types:
      - merging
    out:
    - merged_pairsam
    in:
      input_pairsams:
        fdn_format: pairsam
        source: pairsam-parse-sort/sorted_pairsam
      nThreads: nthreads_merge
  pairsam-markasdup:
    run: pairsam-markasdup.cwl
    fdn_step_meta:
      software_used:
      - pairsamtools_eccd21
      description: Marking duplicates to pairsam file
      analysis_step_types:
      - filter
    out:
    - dupmarked_pairsam
    in:
      input_pairsam:
        fdn_format: pairsam
        source: pairsam-merge/merged_pairsam
  pairsam-filter:
    run: pairsam-filter.cwl
    fdn_step_meta:
      software_used:
      - pairsamtools_eccd21
      description: Filtering duplicate and invalid reads
      analysis_step_types:
      - filter
      - file format conversion
    out:
    - lossless_bamfile
    - filtered_pairs
    in:
      input_pairsam:
        fdn_format: pairsam
        source: pairsam-markasdup/dupmarked_pairsam
      chromsize:
        fdn_format: chromsize
        source: chromsize
outputs:
  annotated_bam:
    type: File
    fdn_format: bam
    fdn_output_type: processed
    outputSource: pairsam-filter/lossless_bamfile
  filtered_pairs:
    type: File
    fdn_output_type: processed
    fdn_format: pairs
    fdn_secondary_file_formats:
    - pairs_px2
    outputSource: pairsam-filter/filtered_pairs
fdn_meta:
  category: filter
  data_types:
  - Hi-C
  name: hi-c-processing-bam
  title: Hi-C Post-alignment Processing
  doc: This is a subworkflow of the Hi-C data processing pipeline. It takes a bam
    file as input and performs parsing, sorting, filtering and deduping. It produces
    two output files, a lossless, filter-annotated bam file and a filtered pairs (contact
    list) file.
  workflow_type: Hi-C data analysis

