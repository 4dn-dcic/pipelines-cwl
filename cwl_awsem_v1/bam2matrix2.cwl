cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/hictool-hdf52matrix:v2
inputs:
  HiC_norm_binning_hdf5:
    type: File
    inputBinding:
      position: 1
      separate: false
  HiC_data_object_hdf5: File?
  fend_object_hdf5: File?
  chromosome:
    type: string
    inputBinding:
      position: 2
      separate: false
  contact_matrix_binsize:
    type: int
    default: 50000
    inputBinding:
      position: 3
      separate: false
  output_dir:
    type: string?
    inputBinding:
      position: 5
      valueFrom:
        engine: '#cwl-js-engine'
        class: Expression
        script: $job.inputs.output_dir || '.'
      separate: false
  chrlen_file:
    type: File?
    inputBinding:
      position: 4
      separate: false
baseCommand: run.sh
outputs:
  observed_contact_matrix:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/HiCtool_observed_contact_matrix*.txt' )
  normalized_fend_contact_matrix:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/HiCtool_normalized_fend_contact_matrix*.txt' )
  normalized_enrich_contact_matrix:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/HiCtool_normalized_enrich_contact_matrix*.txt'
        )
  expected_fend_contact_matrix:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/HiCtool_expected_fend_contact_matrix*.txt' )
  expected_enrich_contact_matrix:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/HiCtool_expected_enrich_contact_matrix*.txt')

