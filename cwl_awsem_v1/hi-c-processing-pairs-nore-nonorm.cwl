cwlVersion: v1.0
class: Workflow
requirements:
  ScatterFeatureRequirement: {}
  InlineJavascriptRequirement: {}
inputs:
  input_pairs:
    type: File[]?
    fdn_format: pairs
  chromsizes:
    type: File
    fdn_format: chromsize
  nthreads:
    type: int
    default: 8
  min_res:
    type: int
    default: 1000
  maxmem:
    type: string
    default: 14g
  higlass:
    type: boolean
    default: false
  juicer_res:
    type: boolean
    default: false
  custom_res:
    type: string
    default: 1000,2000,5000,10000,25000,50000,100000,250000,500000,1000000,2500000,5000000,10000000
  nres:
    type: int
    default: 13
  chunksize:
    type: int
    default: 10000000
  mapqfilter_juicer:
    type: int
    default: 0
  max_split_cooler:
    type: int
    default: 2
  no_balance:
    type: boolean
    default: true
steps:
  merge-pairs:
    run: merge-pairs.cwl
    fdn_step_meta:
      software_used:
      - pairix_0.3.3
      description: Merging pair files
      analysis_step_types:
      - merging
    out:
    - merged_pairs
    in:
      input_pairs:
        fdn_format: pairs
        source: input_pairs
        fdn_type: data file
        fdn_cardinality: array
  cooler:
    run: cooler.cwl
    fdn_step_meta:
      software_used:
      - cooler_0.7.6
      description: Merged Pairs file is processed using Cooler
      analysis_step_types:
      - aggregation
    out:
    - cool
    in:
      pairs:
        fdn_format: pairs
        source: merge-pairs/merged_pairs
        fdn_type: data file
        fdn_cardinality: single
      chrsizes:
        fdn_format: chromsizes
        source: chromsizes
        fdn_type: reference file
        fdn_cardinality: single
      binsize:
        source: min_res
        fdn_type: parameter
        fdn_cardinality: single
      ncores:
        source: nthreads
        fdn_type: parameter
        fdn_cardinality: single
      max_split:
        source: max_split_cooler
        fdn_type: parameter
        fdn_cardinality: single
  pairs2hic:
    run: pairs2hic.cwl
    fdn_step_meta:
      software_used:
      - juicer_tools_1.8.9-cuda8
      description: Merged Pairs file is processed using Juicebox
      analysis_step_types:
      - aggregation
    out:
    - hic
    in:
      input_pairs:
        fdn_format: pairs
        source: merge-pairs/merged_pairs
        fdn_type: data file
        fdn_cardinality: single
      chromsizes:
        fdn_format: chromsizes
        source: chromsizes
        fdn_type: reference file
        fdn_cardinality: single
      min_res:
        source: min_res
        fdn_type: parameter
        fdn_cardinality: single
      higlass:
        source: higlass
        fdn_type: parameter
        fdn_cardinality: single
      custom_res:
        source: custom_res
        fdn_type: parameter
        fdn_cardinality: single
      maxmem:
        source: maxmem
        fdn_type: parameter
        fdn_cardinality: single
      mapqfilter:
        source: mapqfilter_juicer
        fdn_type: parameter
        fdn_cardinality: single
      no_balance:
        source: no_balance
        fdn_type: parameter
        fdn_cardinality: single
  cool2mcool:
    run: cool2mcool.cwl
    fdn_step_meta:
      software_used:
      - cooler_0.7.6
      description: Cooler file is converted to mcool
      analysis_step_types:
      - aggregation
      - file format conversion
    out:
    - mcool
    in:
      input_cool:
        fdn_format: cool
        source: cooler/cool
        fdn_type: data file
        fdn_cardinality: single
      ncores:
        source: nthreads
        fdn_type: parameter
        fdn_cardinality: single
      chunksize:
        source: chunksize
        fdn_type: parameter
        fdn_cardinality: single
      juicer_res:
        source: juicer_res
        fdn_type: parameter
        fdn_cardinality: single
      custom_res:
        source: custom_res
        fdn_type: parameter
        fdn_cardinality: single
      no_balance:
        source: no_balance
        fdn_type: parameter
        fdn_cardinality: single
outputs:
  merged_pairs:
    type: File
    fdn_output_type: processed
    fdn_format: pairs
    fdn_secondary_file_formats:
    - pairs_px2
    outputSource: merge-pairs/merged_pairs
  hic:
    type: File
    fdn_format: hic
    fdn_output_type: processed
    outputSource: pairs2hic/hic
  mcool:
    type: File
    fdn_format: mcool
    fdn_output_type: processed
    outputSource: cool2mcool/mcool
fdn_meta:
  category: merging + aggregation + normalization
  data_types:
  - ChIA-PET
  name: hi-c-processing-pairs-nore-nonorm
  title: Generation of multiresolution Hi-C contact matrices from a set of contact
    lists, no normalization, no restriction enzyme
  doc: This is a subworkflow of the Hi-C data analysis pipeline for the data generated
    without restriction enzyme, without matrix normalization. It takes pairs files
    for all replicates of a sample, merges them and then produces multi-resolution
    Hi-c matrices for visualization. The pipeline produces 4 output files. 1) Replicated
    merged pairs file 2) Contact matrices in .hic format 3) Multiresolution mcool
    file and 4) normalization vector of mcool files for visualization in juicebox.
  workflow_type: Hi-C data analysis

