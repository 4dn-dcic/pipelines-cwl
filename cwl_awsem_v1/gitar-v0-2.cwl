{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#input_fastq2", 
            "isArray": false, 
            "isFile": true, 
            "name": "input_fastq2", 
            "type": [
                "File"
            ]
        }, 
        {
            "id": "#input_fastq1", 
            "isArray": false, 
            "isFile": true, 
            "name": "input_fastq1", 
            "type": [
                "File"
            ]
        }, 
        {
            "id": "#bowtie_index", 
            "isArray": false, 
            "isFile": true, 
            "name": "bowtie_index", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#RE_bed", 
            "isArray": false, 
            "isFile": true, 
            "name": "RE_bed", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#chrlen_file", 
            "isArray": false, 
            "isFile": true, 
            "name": "chrlen_file", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#contact_matrix_binsize", 
            "isArray": false, 
            "isFile": false, 
            "name": "contact_matrix_binsize", 
            "type": [
                "int"
            ]
        }, 
        {
            "id": "#chromosome", 
            "isArray": true, 
            "isFile": false, 
            "name": "chromosome", 
            "type": [
                {
                    "items": "string", 
                    "type": "array"
                }
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#sorted_bam_pe", 
            "isArray": false, 
            "isFile": true, 
            "name": "sorted_bam_pe", 
            "outputSource": "#hictool_fastq2bam/sorted_bam_pe", 
            "source_arg": "sorted_bam_pe", 
            "source_step": "hictool_fastq2bam", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#HiC_project_object_hdf5", 
            "isArray": false, 
            "isFile": true, 
            "name": "HiC_project_object_hdf5", 
            "outputSource": "#hictool_bam2hdf5/HiC_project_object_hdf5", 
            "source_arg": "HiC_project_object_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#HiC_distance_function_hdf5", 
            "isArray": false, 
            "isFile": true, 
            "name": "HiC_distance_function_hdf5", 
            "outputSource": "#hictool_bam2hdf5/HiC_distance_function_hdf5", 
            "source_arg": "HiC_distance_function_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#normalized_fend_contact_matrix", 
            "isArray": false, 
            "isFile": true, 
            "name": "normalized_fend_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/normalized_fend_contact_matrix", 
            "source_arg": "normalized_fend_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#normalized_enrich_contact_matrix", 
            "isArray": false, 
            "isFile": true, 
            "name": "normalized_enrich_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/normalized_enrich_contact_matrix", 
            "source_arg": "normalized_enrich_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#expected_enrich_contact_matrix", 
            "isArray": false, 
            "isFile": true, 
            "name": "expected_enrich_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/expected_enrich_contact_matrix", 
            "source_arg": "expected_enrich_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#split_bam2", 
            "isArray": false, 
            "isFile": true, 
            "name": "split_bam2", 
            "outputSource": "#hictool_fastq2bam/split_bam2", 
            "source_arg": "split_bam2", 
            "source_step": "hictool_fastq2bam", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#split_bam1", 
            "isArray": false, 
            "isFile": true, 
            "name": "split_bam1", 
            "outputSource": "#hictool_fastq2bam/split_bam1", 
            "source_arg": "split_bam1", 
            "source_step": "hictool_fastq2bam", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#fend_object_hdf5", 
            "isArray": false, 
            "isFile": true, 
            "name": "fend_object_hdf5", 
            "outputSource": "#hictool_bam2hdf5/fend_object_hdf5", 
            "source_arg": "fend_object_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#HiC_norm_binning_hdf5", 
            "isArray": false, 
            "isFile": true, 
            "name": "HiC_norm_binning_hdf5", 
            "outputSource": "#hictool_bam2hdf5/HiC_norm_binning_hdf5", 
            "source_arg": "HiC_norm_binning_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#HiC_data_object_hdf5", 
            "isArray": false, 
            "isFile": true, 
            "name": "HiC_data_object_hdf5", 
            "outputSource": "#hictool_bam2hdf5/HiC_data_object_hdf5", 
            "source_arg": "HiC_data_object_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#observed_contact_matrix", 
            "isArray": false, 
            "isFile": true, 
            "name": "observed_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/observed_contact_matrix", 
            "source_arg": "observed_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#expected_fend_contact_matrix", 
            "isArray": false, 
            "isFile": true, 
            "name": "expected_fend_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/expected_fend_contact_matrix", 
            "source_arg": "expected_fend_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "type": [
                "null", 
                "File"
            ]
        }
    ], 
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }
    ], 
    "sourcetarget_list": [
        {
            "source_arg": "sorted_bam_pe", 
            "source_step": "hictool_fastq2bam", 
            "target_arg": "sorted_bam_pe"
        }, 
        {
            "source_arg": "HiC_project_object_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "target_arg": "HiC_project_object_hdf5"
        }, 
        {
            "source_arg": "HiC_distance_function_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "target_arg": "HiC_distance_function_hdf5"
        }, 
        {
            "source_arg": "normalized_fend_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "target_arg": "normalized_fend_contact_matrix"
        }, 
        {
            "source_arg": "normalized_enrich_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "target_arg": "normalized_enrich_contact_matrix"
        }, 
        {
            "source_arg": "expected_enrich_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "target_arg": "expected_enrich_contact_matrix"
        }, 
        {
            "source_arg": "split_bam2", 
            "source_step": "hictool_fastq2bam", 
            "target_arg": "split_bam2"
        }, 
        {
            "source_arg": "split_bam1", 
            "source_step": "hictool_fastq2bam", 
            "target_arg": "split_bam1"
        }, 
        {
            "source_arg": "fend_object_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "target_arg": "fend_object_hdf5"
        }, 
        {
            "source_arg": "HiC_norm_binning_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "target_arg": "HiC_norm_binning_hdf5"
        }, 
        {
            "source_arg": "HiC_data_object_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "target_arg": "HiC_data_object_hdf5"
        }, 
        {
            "source_arg": "observed_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "target_arg": "observed_contact_matrix"
        }, 
        {
            "source_arg": "expected_fend_contact_matrix", 
            "source_step": "hictool_hdf52matrix", 
            "target_arg": "expected_fend_contact_matrix"
        }, 
        {
            "target_arg": "output_dir", 
            "target_step": "hictool_fastq2bam"
        }, 
        {
            "source_arg": "input_fastq2", 
            "target_arg": "input_fastq2", 
            "target_step": "hictool_fastq2bam"
        }, 
        {
            "source_arg": "input_fastq1", 
            "target_arg": "input_fastq1", 
            "target_step": "hictool_fastq2bam"
        }, 
        {
            "source_arg": "bowtie_index", 
            "target_arg": "bowtie_index", 
            "target_step": "hictool_fastq2bam"
        }, 
        {
            "target_arg": "output_dir", 
            "target_step": "hictool_bam2hdf5"
        }, 
        {
            "source_arg": "split_bam2", 
            "source_step": "hictool_fastq2bam", 
            "target_arg": "input_bam2", 
            "target_step": "hictool_bam2hdf5"
        }, 
        {
            "source_arg": "split_bam1", 
            "source_step": "hictool_fastq2bam", 
            "target_arg": "input_bam1", 
            "target_step": "hictool_bam2hdf5"
        }, 
        {
            "source_arg": "RE_bed", 
            "target_arg": "RE_bed", 
            "target_step": "hictool_bam2hdf5"
        }, 
        {
            "target_arg": "output_dir", 
            "target_step": "hictool_hdf52matrix"
        }, 
        {
            "source_arg": "fend_object_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "target_arg": "fend_object_hdf5", 
            "target_step": "hictool_hdf52matrix"
        }, 
        {
            "source_arg": "contact_matrix_binsize", 
            "target_arg": "contact_matrix_binsize", 
            "target_step": "hictool_hdf52matrix"
        }, 
        {
            "source_arg": "chromosome", 
            "target_arg": "chromosome", 
            "target_step": "hictool_hdf52matrix"
        }, 
        {
            "source_arg": "chrlen_file", 
            "target_arg": "chrlen_file", 
            "target_step": "hictool_hdf52matrix"
        }, 
        {
            "source_arg": "HiC_norm_binning_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "target_arg": "HiC_norm_binning_hdf5", 
            "target_step": "hictool_hdf52matrix"
        }, 
        {
            "source_arg": "HiC_data_object_hdf5", 
            "source_step": "hictool_bam2hdf5", 
            "target_arg": "HiC_data_object_hdf5", 
            "target_step": "hictool_hdf52matrix"
        }
    ], 
    "steps": [
        {
            "id": "#hictool_fastq2bam", 
            "in": [
                {
                    "arg_name": "output_dir", 
                    "id": "#hictool_fastq2bam/output_dir", 
                    "name": "hictool_fastq2bam.output_dir", 
                    "step_name": "hictool_fastq2bam"
                }, 
                {
                    "arg_name": "input_fastq2", 
                    "id": "#hictool_fastq2bam/input_fastq2", 
                    "name": "hictool_fastq2bam.input_fastq2", 
                    "source": "#input_fastq2", 
                    "source_arg": "input_fastq2", 
                    "step_name": "hictool_fastq2bam"
                }, 
                {
                    "arg_name": "input_fastq1", 
                    "id": "#hictool_fastq2bam/input_fastq1", 
                    "name": "hictool_fastq2bam.input_fastq1", 
                    "source": "#input_fastq1", 
                    "source_arg": "input_fastq1", 
                    "step_name": "hictool_fastq2bam"
                }, 
                {
                    "arg_name": "bowtie_index", 
                    "id": "#hictool_fastq2bam/bowtie_index", 
                    "name": "hictool_fastq2bam.bowtie_index", 
                    "source": "#bowtie_index", 
                    "source_arg": "bowtie_index", 
                    "step_name": "hictool_fastq2bam"
                }
            ], 
            "name": "hictool_fastq2bam", 
            "out": [
                {
                    "arg_name": "split_bam2", 
                    "id": "#hictool_fastq2bam/split_bam2", 
                    "name": "hictool_fastq2bam.split_bam2", 
                    "step_name": "hictool_fastq2bam"
                }, 
                {
                    "arg_name": "split_bam1", 
                    "id": "#hictool_fastq2bam/split_bam1", 
                    "name": "hictool_fastq2bam.split_bam1", 
                    "step_name": "hictool_fastq2bam"
                }, 
                {
                    "arg_name": "sorted_bam_pe", 
                    "id": "#hictool_fastq2bam/sorted_bam_pe", 
                    "name": "hictool_fastq2bam.sorted_bam_pe", 
                    "step_name": "hictool_fastq2bam"
                }
            ], 
            "run": "fastq2bam.cwl"
        }, 
        {
            "id": "#hictool_bam2hdf5", 
            "in": [
                {
                    "arg_name": "output_dir", 
                    "id": "#hictool_bam2hdf5/output_dir", 
                    "name": "hictool_bam2hdf5.output_dir", 
                    "step_name": "hictool_bam2hdf5"
                }, 
                {
                    "arg_name": "input_bam2", 
                    "id": "#hictool_bam2hdf5/input_bam2", 
                    "name": "hictool_bam2hdf5.input_bam2", 
                    "source": "#hictool_fastq2bam/split_bam2", 
                    "source_arg": "split_bam2", 
                    "source_step": "hictool_fastq2bam", 
                    "step_name": "hictool_bam2hdf5"
                }, 
                {
                    "arg_name": "input_bam1", 
                    "id": "#hictool_bam2hdf5/input_bam1", 
                    "name": "hictool_bam2hdf5.input_bam1", 
                    "source": "#hictool_fastq2bam/split_bam1", 
                    "source_arg": "split_bam1", 
                    "source_step": "hictool_fastq2bam", 
                    "step_name": "hictool_bam2hdf5"
                }, 
                {
                    "arg_name": "RE_bed", 
                    "id": "#hictool_bam2hdf5/RE_bed", 
                    "name": "hictool_bam2hdf5.RE_bed", 
                    "source": "#RE_bed", 
                    "source_arg": "RE_bed", 
                    "step_name": "hictool_bam2hdf5"
                }
            ], 
            "name": "hictool_bam2hdf5", 
            "out": [
                {
                    "arg_name": "fend_object_hdf5", 
                    "id": "#hictool_bam2hdf5/fend_object_hdf5", 
                    "name": "hictool_bam2hdf5.fend_object_hdf5", 
                    "step_name": "hictool_bam2hdf5"
                }, 
                {
                    "arg_name": "HiC_project_object_hdf5", 
                    "id": "#hictool_bam2hdf5/HiC_project_object_hdf5", 
                    "name": "hictool_bam2hdf5.HiC_project_object_hdf5", 
                    "step_name": "hictool_bam2hdf5"
                }, 
                {
                    "arg_name": "HiC_norm_binning_hdf5", 
                    "id": "#hictool_bam2hdf5/HiC_norm_binning_hdf5", 
                    "name": "hictool_bam2hdf5.HiC_norm_binning_hdf5", 
                    "step_name": "hictool_bam2hdf5"
                }, 
                {
                    "arg_name": "HiC_distance_function_hdf5", 
                    "id": "#hictool_bam2hdf5/HiC_distance_function_hdf5", 
                    "name": "hictool_bam2hdf5.HiC_distance_function_hdf5", 
                    "step_name": "hictool_bam2hdf5"
                }, 
                {
                    "arg_name": "HiC_data_object_hdf5", 
                    "id": "#hictool_bam2hdf5/HiC_data_object_hdf5", 
                    "name": "hictool_bam2hdf5.HiC_data_object_hdf5", 
                    "step_name": "hictool_bam2hdf5"
                }
            ], 
            "run": "bam2hdf5.cwl"
        }, 
        {
            "id": "#hictool_hdf52matrix", 
            "in": [
                {
                    "arg_name": "output_dir", 
                    "id": "#hictool_hdf52matrix/output_dir", 
                    "name": "hictool_hdf52matrix.output_dir", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "fend_object_hdf5", 
                    "id": "#hictool_hdf52matrix/fend_object_hdf5", 
                    "name": "hictool_hdf52matrix.fend_object_hdf5", 
                    "source": "#hictool_bam2hdf5/fend_object_hdf5", 
                    "source_arg": "fend_object_hdf5", 
                    "source_step": "hictool_bam2hdf5", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "contact_matrix_binsize", 
                    "id": "#hictool_hdf52matrix/contact_matrix_binsize", 
                    "name": "hictool_hdf52matrix.contact_matrix_binsize", 
                    "source": "#contact_matrix_binsize", 
                    "source_arg": "contact_matrix_binsize", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "chromosome", 
                    "id": "#hictool_hdf52matrix/chromosome", 
                    "name": "hictool_hdf52matrix.chromosome", 
                    "source": "#chromosome", 
                    "source_arg": "chromosome", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "chrlen_file", 
                    "id": "#hictool_hdf52matrix/chrlen_file", 
                    "name": "hictool_hdf52matrix.chrlen_file", 
                    "source": "#chrlen_file", 
                    "source_arg": "chrlen_file", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "HiC_norm_binning_hdf5", 
                    "id": "#hictool_hdf52matrix/HiC_norm_binning_hdf5", 
                    "name": "hictool_hdf52matrix.HiC_norm_binning_hdf5", 
                    "source": "#hictool_bam2hdf5/HiC_norm_binning_hdf5", 
                    "source_arg": "HiC_norm_binning_hdf5", 
                    "source_step": "hictool_bam2hdf5", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "HiC_data_object_hdf5", 
                    "id": "#hictool_hdf52matrix/HiC_data_object_hdf5", 
                    "name": "hictool_hdf52matrix.HiC_data_object_hdf5", 
                    "source": "#hictool_bam2hdf5/HiC_data_object_hdf5", 
                    "source_arg": "HiC_data_object_hdf5", 
                    "source_step": "hictool_bam2hdf5", 
                    "step_name": "hictool_hdf52matrix"
                }
            ], 
            "name": "hictool_hdf52matrix", 
            "out": [
                {
                    "arg_name": "observed_contact_matrix", 
                    "id": "#hictool_hdf52matrix/observed_contact_matrix", 
                    "name": "hictool_hdf52matrix.observed_contact_matrix", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "normalized_fend_contact_matrix", 
                    "id": "#hictool_hdf52matrix/normalized_fend_contact_matrix", 
                    "name": "hictool_hdf52matrix.normalized_fend_contact_matrix", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "normalized_enrich_contact_matrix", 
                    "id": "#hictool_hdf52matrix/normalized_enrich_contact_matrix", 
                    "name": "hictool_hdf52matrix.normalized_enrich_contact_matrix", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "expected_fend_contact_matrix", 
                    "id": "#hictool_hdf52matrix/expected_fend_contact_matrix", 
                    "name": "hictool_hdf52matrix.expected_fend_contact_matrix", 
                    "step_name": "hictool_hdf52matrix"
                }, 
                {
                    "arg_name": "expected_enrich_contact_matrix", 
                    "id": "#hictool_hdf52matrix/expected_enrich_contact_matrix", 
                    "name": "hictool_hdf52matrix.expected_enrich_contact_matrix", 
                    "step_name": "hictool_hdf52matrix"
                }
            ], 
            "run": "bam2matrix2.cwl", 
            "scatter": "#hictool_hdf52matrix/chromosome"
        }
    ]
}