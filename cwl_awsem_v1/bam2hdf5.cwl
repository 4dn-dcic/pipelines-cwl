cwlVersion: v1.0
class: CommandLineTool
requirements:
  InlineJavascriptRequirement: {}
hints:
  DockerRequirement:
    dockerPull: duplexa/hictool-bam2hdf5:v2
inputs:
  input_bam1:
    type: File
    inputBinding:
      position: 1
      separate: false
  input_bam2:
    type: File
    inputBinding:
      position: 2
      separate: false
  output_dir:
    type: string?
    inputBinding:
      position: 4
      valueFrom:
        engine: '#cwl-js-engine'
        class: Expression
        script: $job.inputs.output_dir || '.'
      separate: false
  RE_bed:
    type: File?
    inputBinding:
      position: 3
      separate: false
baseCommand: run.sh
outputs:
  fend_object_hdf5:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/fend_object.hdf5')
  HiC_data_object_hdf5:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/HiC_data_object.hdf5')
  HiC_distance_function_hdf5:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/HiC_distance_function.hdf5')
  HiC_norm_binning_hdf5:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/HiC_norm_binning.hdf5')
  HiC_project_object_hdf5:
    type: File?
    outputBinding:
      glob: $(inputs.output_dir + '/HiC_project_object.hdf5' )

