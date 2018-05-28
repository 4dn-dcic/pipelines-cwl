cwlVersion: v1.0
class: Workflow
requirements:
  InlineJavascriptRequirement: {}
inputs:
  input_merged_nodups: File?
  chromsize: File?
steps:
  oldjuicer2pairs:
    run: oldjuicer2pairs.cwl
    out:
    - out_pairs
    - out_pairs_px
    in:
      input_merged_nodups: input_merged_nodups
      chromsize: chromsize
      nsplit: {}
      outprefix: {}
      max_remove_mapq: {}
  hic_pairs_to_end:
    run: hic-pairs-to-end.cwl
    out:
    - output_pairs
    - output_mcool
    - output_normvector
    - output_hic
    - output_pairs_index
    in:
      chrsizes: oldjuicer2pairs/out_pairs
      input_pairs: oldjuicer2pairs/out_pairs_px
      ncores: {}
      min_res: {}
      binsize: {}
      ncores_1: {}
      nres: {}
outputs:
  output_pairs_index:
    type: File?
    outputSource: hic_pairs_to_end/output_pairs_index
  output_pairs:
    type: File?
    outputSource: hic_pairs_to_end/output_pairs
  output_normvector:
    type: File?
    outputSource: hic_pairs_to_end/output_normvector
  output_mcool:
    type: File?
    outputSource: hic_pairs_to_end/output_mcool
  output_hic:
    type: File?
    outputSource: hic_pairs_to_end/output_hic
  out_pairs_px:
    type: File?
    outputSource: oldjuicer2pairs/out_pairs_px
  out_pairs:
    type: File?
    outputSource: oldjuicer2pairs/out_pairs

