{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#input_fastq2", 
            "type": [
                "File"
            ]
        }, 
        {
            "id": "#input_fastq1", 
            "type": [
                "File"
            ]
        }, 
        {
            "id": "#bowtie_index", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#RE_bed", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#chrlen_file", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#contact_matrix_binsize", 
            "type": [
                "int"
            ]
        }, 
        {
            "id": "#chromosome", 
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
            "outputSource": "#hictool_fastq2bam/sorted_bam_pe", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#HiC_project_object_hdf5", 
            "outputSource": "#hictool_bam2hdf5/HiC_project_object_hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#HiC_distance_function_hdf5", 
            "outputSource": "#hictool_bam2hdf5/HiC_distance_function_hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#normalized_fend_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/normalized_fend_contact_matrix", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#normalized_enrich_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/normalized_enrich_contact_matrix", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#expected_enrich_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/expected_enrich_contact_matrix", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#split_bam2", 
            "outputSource": "#hictool_fastq2bam/split_bam2", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#split_bam1", 
            "outputSource": "#hictool_fastq2bam/split_bam1", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#fend_object_hdf5", 
            "outputSource": "#hictool_bam2hdf5/fend_object_hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#HiC_norm_binning_hdf5", 
            "outputSource": "#hictool_bam2hdf5/HiC_norm_binning_hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#HiC_data_object_hdf5", 
            "outputSource": "#hictool_bam2hdf5/HiC_data_object_hdf5", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#observed_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/observed_contact_matrix", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#expected_fend_contact_matrix", 
            "outputSource": "#hictool_hdf52matrix/expected_fend_contact_matrix", 
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
    "steps": [
        {
            "id": "#hictool_fastq2bam", 
            "in": [
                {
                    "arg_name": "output_dir", 
                    "id": "#hictool_fastq2bam/output_dir"
                }, 
                {
                    "arg_name": "input_fastq2", 
                    "id": "#hictool_fastq2bam/input_fastq2", 
                    "source": "#input_fastq2"
                }, 
                {
                    "arg_name": "input_fastq1", 
                    "id": "#hictool_fastq2bam/input_fastq1", 
                    "source": "#input_fastq1"
                }, 
                {
                    "arg_name": "bowtie_index", 
                    "id": "#hictool_fastq2bam/bowtie_index", 
                    "source": "#bowtie_index"
                }
            ], 
            "out": [
                {
                    "arg_name": "split_bam2", 
                    "id": "#hictool_fastq2bam/split_bam2"
                }, 
                {
                    "arg_name": "split_bam1", 
                    "id": "#hictool_fastq2bam/split_bam1"
                }, 
                {
                    "arg_name": "sorted_bam_pe", 
                    "id": "#hictool_fastq2bam/sorted_bam_pe"
                }
            ], 
            "run": "fastq2bam.cwl"
        }, 
        {
            "id": "#hictool_bam2hdf5", 
            "in": [
                {
                    "arg_name": "output_dir", 
                    "id": "#hictool_bam2hdf5/output_dir"
                }, 
                {
                    "arg_name": "input_bam2", 
                    "id": "#hictool_bam2hdf5/input_bam2", 
                    "source": "#hictool_fastq2bam/split_bam2"
                }, 
                {
                    "arg_name": "input_bam1", 
                    "id": "#hictool_bam2hdf5/input_bam1", 
                    "source": "#hictool_fastq2bam/split_bam1"
                }, 
                {
                    "arg_name": "RE_bed", 
                    "id": "#hictool_bam2hdf5/RE_bed", 
                    "source": "#RE_bed"
                }
            ], 
            "out": [
                {
                    "arg_name": "fend_object_hdf5", 
                    "id": "#hictool_bam2hdf5/fend_object_hdf5"
                }, 
                {
                    "arg_name": "HiC_project_object_hdf5", 
                    "id": "#hictool_bam2hdf5/HiC_project_object_hdf5"
                }, 
                {
                    "arg_name": "HiC_norm_binning_hdf5", 
                    "id": "#hictool_bam2hdf5/HiC_norm_binning_hdf5"
                }, 
                {
                    "arg_name": "HiC_distance_function_hdf5", 
                    "id": "#hictool_bam2hdf5/HiC_distance_function_hdf5"
                }, 
                {
                    "arg_name": "HiC_data_object_hdf5", 
                    "id": "#hictool_bam2hdf5/HiC_data_object_hdf5"
                }
            ], 
            "run": "bam2hdf5.cwl"
        }, 
        {
            "id": "#hictool_hdf52matrix", 
            "in": [
                {
                    "arg_name": "output_dir", 
                    "id": "#hictool_hdf52matrix/output_dir"
                }, 
                {
                    "arg_name": "fend_object_hdf5", 
                    "id": "#hictool_hdf52matrix/fend_object_hdf5", 
                    "source": "#hictool_bam2hdf5/fend_object_hdf5"
                }, 
                {
                    "arg_name": "contact_matrix_binsize", 
                    "id": "#hictool_hdf52matrix/contact_matrix_binsize", 
                    "source": "#contact_matrix_binsize"
                }, 
                {
                    "arg_name": "chromosome", 
                    "id": "#hictool_hdf52matrix/chromosome", 
                    "source": "#chromosome"
                }, 
                {
                    "arg_name": "chrlen_file", 
                    "id": "#hictool_hdf52matrix/chrlen_file", 
                    "source": "#chrlen_file"
                }, 
                {
                    "arg_name": "HiC_norm_binning_hdf5", 
                    "id": "#hictool_hdf52matrix/HiC_norm_binning_hdf5", 
                    "source": "#hictool_bam2hdf5/HiC_norm_binning_hdf5"
                }, 
                {
                    "arg_name": "HiC_data_object_hdf5", 
                    "id": "#hictool_hdf52matrix/HiC_data_object_hdf5", 
                    "source": "#hictool_bam2hdf5/HiC_data_object_hdf5"
                }
            ], 
            "out": [
                {
                    "arg_name": "observed_contact_matrix", 
                    "id": "#hictool_hdf52matrix/observed_contact_matrix"
                }, 
                {
                    "arg_name": "normalized_fend_contact_matrix", 
                    "id": "#hictool_hdf52matrix/normalized_fend_contact_matrix"
                }, 
                {
                    "arg_name": "normalized_enrich_contact_matrix", 
                    "id": "#hictool_hdf52matrix/normalized_enrich_contact_matrix"
                }, 
                {
                    "arg_name": "expected_fend_contact_matrix", 
                    "id": "#hictool_hdf52matrix/expected_fend_contact_matrix"
                }, 
                {
                    "arg_name": "expected_enrich_contact_matrix", 
                    "id": "#hictool_hdf52matrix/expected_enrich_contact_matrix"
                }
            ], 
            "run": "bam2matrix2.cwl", 
            "scatter": "#hictool_hdf52matrix/chromosome"
        }
    ]
}