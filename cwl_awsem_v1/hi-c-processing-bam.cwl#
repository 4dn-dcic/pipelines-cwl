{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "fdn_meta": {
        "category": "filter", 
        "data_types": [
            "Hi-C"
        ], 
        "description": "This is a subworkflow of the Hi-C data processing pipeline. It takes a bam file as input and performs parsing, sorting, filtering and deduping. It produces two output files, a lossless, filter-annotated bam file and a filtered pairs (contact list) file.", 
        "name": "hi-c-processing-bam", 
        "title": "Hi-C Post-alignment Processing", 
        "workflow_type": "Hi-C data analysis"
    }, 
    "inputs": [
        {
            "fdn_format": "bam", 
            "id": "#input_bams", 
            "isArray": true, 
            "isFile": true, 
            "name": "input_bams", 
            "type": [
                {
                    "items": "File", 
                    "type": "array"
                }
            ]
        }, 
        {
            "fdn_format": "chromsizes", 
            "id": "#chromsize", 
            "isArray": false, 
            "isFile": true, 
            "name": "chromsize", 
            "type": [
                "File"
            ]
        }, 
        {
            "default": 8, 
            "id": "#nthreads_parse_sort", 
            "isArray": false, 
            "isFile": false, 
            "name": "nthreads_parse_sort", 
            "type": [
                "int"
            ]
        }, 
        {
            "default": 8, 
            "id": "#nthreads_merge", 
            "isArray": false, 
            "isFile": false, 
            "name": "nthreads_merge", 
            "type": [
                "int"
            ]
        }
    ], 
    "outputs": [
        {
            "fdn_format": "bam", 
            "fdn_output_type": "processed", 
            "id": "#annotated_bam", 
            "isArray": false, 
            "isFile": true, 
            "name": "annotated_bam", 
            "outputSource": "#pairsam-filter/lossless_bamfile", 
            "source_arg": "lossless_bamfile", 
            "source_step": "pairsam-filter", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "pairs", 
            "fdn_output_type": "processed", 
            "fdn_secondary_file_formats": [
                "pairs_px2"
            ], 
            "id": "#filtered_pairs", 
            "isArray": false, 
            "isFile": true, 
            "name": "filtered_pairs", 
            "outputSource": "#pairsam-filter/filtered_pairs", 
            "source_arg": "filtered_pairs", 
            "source_step": "pairsam-filter", 
            "type": [
                "File"
            ]
        }
    ], 
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }, 
        {
            "class": "ScatterFeatureRequirement"
        }
    ], 
    "sourcetarget_list": [
        {
            "source_arg": "lossless_bamfile", 
            "source_step": "pairsam-filter", 
            "target_arg": "annotated_bam"
        }, 
        {
            "source_arg": "filtered_pairs", 
            "source_step": "pairsam-filter", 
            "target_arg": "filtered_pairs"
        }, 
        {
            "source_arg": "input_bams", 
            "target_arg": "bam", 
            "target_step": "pairsam-parse-sort"
        }, 
        {
            "source_arg": "chromsize", 
            "target_arg": "chromsize", 
            "target_step": "pairsam-parse-sort"
        }, 
        {
            "source_arg": "nthreads_parse_sort", 
            "target_arg": "Threads", 
            "target_step": "pairsam-parse-sort"
        }, 
        {
            "source_arg": "sorted_pairsam", 
            "source_step": "pairsam-parse-sort", 
            "target_arg": "input_pairsams", 
            "target_step": "pairsam-merge"
        }, 
        {
            "source_arg": "nthreads_merge", 
            "target_arg": "nThreads", 
            "target_step": "pairsam-merge"
        }, 
        {
            "source_arg": "merged_pairsam", 
            "source_step": "pairsam-merge", 
            "target_arg": "input_pairsam", 
            "target_step": "pairsam-markasdup"
        }, 
        {
            "source_arg": "dupmarked_pairsam", 
            "source_step": "pairsam-markasdup", 
            "target_arg": "input_pairsam", 
            "target_step": "pairsam-filter"
        }, 
        {
            "source_arg": "chromsize", 
            "target_arg": "chromsize", 
            "target_step": "pairsam-filter"
        }
    ], 
    "steps": [
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "annotation", 
                    "sorting"
                ], 
                "description": "Parsing and sorting bam file", 
                "software_used": [
                    "pairsamtools_eccd21"
                ]
            }, 
            "id": "#pairsam-parse-sort", 
            "in": [
                {
                    "arg_name": "bam", 
                    "fdn_format": "bam", 
                    "id": "#pairsam-parse-sort/bam", 
                    "name": "pairsam-parse-sort.bam", 
                    "source": "#input_bams", 
                    "source_arg": "input_bams", 
                    "step_name": "pairsam-parse-sort"
                }, 
                {
                    "arg_name": "chromsize", 
                    "fdn_format": "chromsize", 
                    "id": "#pairsam-parse-sort/chromsize", 
                    "name": "pairsam-parse-sort.chromsize", 
                    "source": "#chromsize", 
                    "source_arg": "chromsize", 
                    "step_name": "pairsam-parse-sort"
                }, 
                {
                    "arg_name": "Threads", 
                    "id": "#pairsam-parse-sort/Threads", 
                    "name": "pairsam-parse-sort.Threads", 
                    "source": "#nthreads_parse_sort", 
                    "source_arg": "nthreads_parse_sort", 
                    "step_name": "pairsam-parse-sort"
                }
            ], 
            "name": "pairsam-parse-sort", 
            "out": [
                {
                    "arg_name": "sorted_pairsam", 
                    "fdn_format": "pairsam", 
                    "id": "#pairsam-parse-sort/sorted_pairsam", 
                    "name": "pairsam-parse-sort.sorted_pairsam", 
                    "step_name": "pairsam-parse-sort"
                }
            ], 
            "run": "pairsam-parse-sort.cwl", 
            "scatter": "#pairsam-parse-sort.bam"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "merging"
                ], 
                "description": "Merging pairsam files", 
                "software_used": [
                    "pairsamtools_eccd21"
                ]
            }, 
            "id": "#pairsam-merge", 
            "in": [
                {
                    "arg_name": "input_pairsams", 
                    "fdn_format": "pairsam", 
                    "id": "#pairsam-merge/input_pairsams", 
                    "name": "pairsam-merge.input_pairsams", 
                    "source": "#pairsam-parse-sort/sorted_pairsam", 
                    "source_arg": "sorted_pairsam", 
                    "source_step": "pairsam-parse-sort", 
                    "step_name": "pairsam-merge"
                }, 
                {
                    "arg_name": "nThreads", 
                    "id": "#pairsam-merge/nThreads", 
                    "name": "pairsam-merge.nThreads", 
                    "source": "#nthreads_merge", 
                    "source_arg": "nthreads_merge", 
                    "step_name": "pairsam-merge"
                }
            ], 
            "name": "pairsam-merge", 
            "out": [
                {
                    "arg_name": "merged_pairsam", 
                    "fdn_format": "pairsam", 
                    "id": "#pairsam-merge/merged_pairsam", 
                    "name": "pairsam-merge.merged_pairsam", 
                    "step_name": "pairsam-merge"
                }
            ], 
            "run": "pairsam-merge.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "filter"
                ], 
                "description": "Marking duplicates to pairsam file", 
                "software_used": [
                    "pairsamtools_eccd21"
                ]
            }, 
            "id": "#pairsam-markasdup", 
            "in": [
                {
                    "arg_name": "input_pairsam", 
                    "fdn_format": "pairsam", 
                    "id": "#pairsam-markasdup/input_pairsam", 
                    "name": "pairsam-markasdup.input_pairsam", 
                    "source": "#pairsam-merge/merged_pairsam", 
                    "source_arg": "merged_pairsam", 
                    "source_step": "pairsam-merge", 
                    "step_name": "pairsam-markasdup"
                }
            ], 
            "name": "pairsam-markasdup", 
            "out": [
                {
                    "arg_name": "dupmarked_pairsam", 
                    "fdn_format": "pairsam", 
                    "id": "#pairsam-markasdup/dupmarked_pairsam", 
                    "name": "pairsam-markasdup.dupmarked_pairsam", 
                    "step_name": "pairsam-markasdup"
                }
            ], 
            "run": "pairsam-markasdup.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "filter", 
                    "file format conversion"
                ], 
                "description": "Filtering duplicate and invalid reads", 
                "software_used": [
                    "pairsamtools_eccd21"
                ]
            }, 
            "id": "#pairsam-filter", 
            "in": [
                {
                    "arg_name": "input_pairsam", 
                    "fdn_format": "pairsam", 
                    "id": "#pairsam-filter/input_pairsam", 
                    "name": "pairsam-filter.input_pairsam", 
                    "source": "#pairsam-markasdup/dupmarked_pairsam", 
                    "source_arg": "dupmarked_pairsam", 
                    "source_step": "pairsam-markasdup", 
                    "step_name": "pairsam-filter"
                }, 
                {
                    "arg_name": "chromsize", 
                    "fdn_format": "chromsize", 
                    "id": "#pairsam-filter/chromsize", 
                    "name": "pairsam-filter.chromsize", 
                    "source": "#chromsize", 
                    "source_arg": "chromsize", 
                    "step_name": "pairsam-filter"
                }
            ], 
            "name": "pairsam-filter", 
            "out": [
                {
                    "arg_name": "lossless_bamfile", 
                    "fdn_format": "bam", 
                    "id": "#pairsam-filter/lossless_bamfile", 
                    "name": "pairsam-filter.lossless_bamfile", 
                    "step_name": "pairsam-filter"
                }, 
                {
                    "arg_name": "filtered_pairs", 
                    "fdn_format": "pairs", 
                    "id": "#pairsam-filter/filtered_pairs", 
                    "name": "pairsam-filter.filtered_pairs", 
                    "step_name": "pairsam-filter"
                }
            ], 
            "run": "pairsam-filter.cwl"
        }
    ]
}