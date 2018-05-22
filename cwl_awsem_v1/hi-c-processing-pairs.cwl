{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "fdn_meta": {
        "category": "merging + aggregation + normalization", 
        "data_types": [
            "Hi-C"
        ], 
        "description": "This is a subworkflow of the Hi-C data analysis pipeline. It takes pairs files for all replicates of a sample, merges them and then produces multi-resolution Hi-c matrices for visualization. The pipeline produces 4 output files. 1) Replicated merged pairs file 2) Contact matrices in .hic format 3) Multiresolution mcool file and 4) normalization vector of mcool files for visualization in juicebox.", 
        "name": "hi-c-processing-pairs", 
        "title": "Generation of multiresolution Hi-C contact matrices from a set of contact lists", 
        "workflow_type": "Hi-C data analysis"
    }, 
    "inputs": [
        {
            "fdn_format": "pairs", 
            "id": "#input_pairs", 
            "isArray": true, 
            "isFile": true, 
            "name": "input_pairs", 
            "type": [
                "null", 
                {
                    "items": "File", 
                    "type": "array"
                }
            ]
        }, 
        {
            "fdn_format": "chromsize", 
            "id": "#chromsizes", 
            "isArray": false, 
            "isFile": true, 
            "name": "chromsizes", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "juicer_format_restriction_site_file", 
            "id": "#restriction_file", 
            "isArray": false, 
            "isFile": true, 
            "name": "restriction_file", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "default": 8, 
            "id": "#nthreads", 
            "isArray": false, 
            "isFile": false, 
            "name": "nthreads", 
            "type": [
                "int"
            ]
        }, 
        {
            "default": 1000, 
            "id": "#min_res", 
            "isArray": false, 
            "isFile": false, 
            "name": "min_res", 
            "type": [
                "int"
            ]
        }, 
        {
            "default": "14g", 
            "id": "#maxmem", 
            "isArray": false, 
            "isFile": false, 
            "name": "maxmem", 
            "type": [
                "string"
            ]
        }, 
        {
            "default": false, 
            "id": "#higlass", 
            "isArray": false, 
            "isFile": false, 
            "name": "higlass", 
            "type": [
                "boolean"
            ]
        }, 
        {
            "default": false, 
            "id": "#juicer_res", 
            "isArray": false, 
            "isFile": false, 
            "name": "juicer_res", 
            "type": [
                "boolean"
            ]
        }, 
        {
            "default": "1000,2000,5000,10000,25000,50000,100000,250000,500000,1000000,2500000,5000000,10000000", 
            "id": "#custom_res", 
            "isArray": false, 
            "isFile": false, 
            "name": "custom_res", 
            "type": [
                "string"
            ]
        }, 
        {
            "default": 13, 
            "id": "#nres", 
            "isArray": false, 
            "isFile": false, 
            "name": "nres", 
            "type": [
                "int"
            ]
        }, 
        {
            "default": 10000000, 
            "id": "#chunksize", 
            "isArray": false, 
            "isFile": false, 
            "name": "chunksize", 
            "type": [
                "int"
            ]
        }, 
        {
            "default": 0, 
            "id": "#mapqfilter_juicer", 
            "isArray": false, 
            "isFile": false, 
            "name": "mapqfilter_juicer", 
            "type": [
                "int"
            ]
        }, 
        {
            "default": 2, 
            "id": "#max_split_cooler", 
            "isArray": false, 
            "isFile": false, 
            "name": "max_split_cooler", 
            "type": [
                "int"
            ]
        }, 
        {
            "default": false, 
            "id": "#nofrag", 
            "isArray": false, 
            "isFile": false, 
            "name": "nofrag", 
            "type": [
                "boolean"
            ]
        }
    ], 
    "outputs": [
        {
            "fdn_format": "pairs", 
            "fdn_output_type": "processed", 
            "fdn_secondary_file_formats": [
                "pairs_px2"
            ], 
            "id": "#merged_pairs", 
            "isArray": false, 
            "isFile": true, 
            "name": "merged_pairs", 
            "outputSource": "#merge-pairs/merged_pairs", 
            "source_arg": "merged_pairs", 
            "source_step": "merge-pairs", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "hic", 
            "fdn_output_type": "processed", 
            "id": "#hic", 
            "isArray": false, 
            "isFile": true, 
            "name": "hic", 
            "outputSource": "#pairs2hic/hic", 
            "source_arg": "hic", 
            "source_step": "pairs2hic", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "mcool", 
            "fdn_output_type": "processed", 
            "id": "#mcool", 
            "isArray": false, 
            "isFile": true, 
            "name": "mcool", 
            "outputSource": "#add-hic-normvector-to-mcool/mcool_with_hicnorm", 
            "source_arg": "mcool_with_hicnorm", 
            "source_step": "add-hic-normvector-to-mcool", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "normvector_juicerformat", 
            "fdn_output_type": "processed", 
            "id": "#cooler_normvector", 
            "isArray": false, 
            "isFile": true, 
            "name": "cooler_normvector", 
            "outputSource": "#extract-mcool-normvector-for-juicebox/cooler_normvector", 
            "source_arg": "cooler_normvector", 
            "source_step": "extract-mcool-normvector-for-juicebox", 
            "type": [
                "File"
            ]
        }
    ], 
    "requirements": [
        {
            "class": "ScatterFeatureRequirement"
        }, 
        {
            "class": "InlineJavascriptRequirement"
        }
    ], 
    "sourcetarget_list": [
        {
            "source_arg": "merged_pairs", 
            "source_step": "merge-pairs", 
            "target_arg": "merged_pairs"
        }, 
        {
            "source_arg": "hic", 
            "source_step": "pairs2hic", 
            "target_arg": "hic"
        }, 
        {
            "source_arg": "mcool_with_hicnorm", 
            "source_step": "add-hic-normvector-to-mcool", 
            "target_arg": "mcool"
        }, 
        {
            "source_arg": "cooler_normvector", 
            "source_step": "extract-mcool-normvector-for-juicebox", 
            "target_arg": "cooler_normvector"
        }, 
        {
            "source_arg": "input_pairs", 
            "target_arg": "input_pairs", 
            "target_step": "merge-pairs"
        }, 
        {
            "source_arg": "merged_pairs", 
            "source_step": "merge-pairs", 
            "target_arg": "input_pairs", 
            "target_step": "addfragtopairs"
        }, 
        {
            "source_arg": "restriction_file", 
            "target_arg": "restriction_file", 
            "target_step": "addfragtopairs"
        }, 
        {
            "source_arg": "nofrag", 
            "target_arg": "donothing", 
            "target_step": "addfragtopairs"
        }, 
        {
            "source_arg": "merged_pairs", 
            "source_step": "merge-pairs", 
            "target_arg": "pairs", 
            "target_step": "cooler"
        }, 
        {
            "source_arg": "chromsizes", 
            "target_arg": "chrsizes", 
            "target_step": "cooler"
        }, 
        {
            "source_arg": "min_res", 
            "target_arg": "binsize", 
            "target_step": "cooler"
        }, 
        {
            "source_arg": "nthreads", 
            "target_arg": "ncores", 
            "target_step": "cooler"
        }, 
        {
            "source_arg": "max_split_cooler", 
            "target_arg": "max_split", 
            "target_step": "cooler"
        }, 
        {
            "source_arg": "pairs_with_frags", 
            "source_step": "addfragtopairs", 
            "target_arg": "input_pairs", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "chromsizes", 
            "target_arg": "chromsizes", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "min_res", 
            "target_arg": "min_res", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "higlass", 
            "target_arg": "higlass", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "custom_res", 
            "target_arg": "custom_res", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "maxmem", 
            "target_arg": "maxmem", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "mapqfilter_juicer", 
            "target_arg": "mapqfilter", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "cool", 
            "source_step": "cooler", 
            "target_arg": "input_cool", 
            "target_step": "cool2mcool"
        }, 
        {
            "source_arg": "nthreads", 
            "target_arg": "ncores", 
            "target_step": "cool2mcool"
        }, 
        {
            "source_arg": "chunksize", 
            "target_arg": "chunksize", 
            "target_step": "cool2mcool"
        }, 
        {
            "source_arg": "juicer_res", 
            "target_arg": "juicer_res", 
            "target_step": "cool2mcool"
        }, 
        {
            "source_arg": "custom_res", 
            "target_arg": "custom_res", 
            "target_step": "cool2mcool"
        }, 
        {
            "source_arg": "mcool", 
            "source_step": "cool2mcool", 
            "target_arg": "input_mcool", 
            "target_step": "add-hic-normvector-to-mcool"
        }, 
        {
            "source_arg": "hic", 
            "source_step": "pairs2hic", 
            "target_arg": "input_hic", 
            "target_step": "add-hic-normvector-to-mcool"
        }, 
        {
            "source_arg": "custom_res", 
            "target_arg": "custom_res", 
            "target_step": "extract-mcool-normvector-for-juicebox"
        }, 
        {
            "source_arg": "chromsizes", 
            "target_arg": "chromsize", 
            "target_step": "extract-mcool-normvector-for-juicebox"
        }, 
        {
            "source_arg": "mcool_with_hicnorm", 
            "source_step": "add-hic-normvector-to-mcool", 
            "target_arg": "mcool", 
            "target_step": "extract-mcool-normvector-for-juicebox"
        }
    ], 
    "steps": [
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "merging"
                ], 
                "description": "Merging pair files", 
                "software_used": [
                    "pairix_0.3.3"
                ]
            }, 
            "id": "#merge-pairs", 
            "in": [
                {
                    "arg_name": "input_pairs", 
                    "fdn_cardinality": "array", 
                    "fdn_format": "pairs", 
                    "fdn_type": "data file", 
                    "id": "#merge-pairs/input_pairs", 
                    "name": "merge-pairs.input_pairs", 
                    "source": "#input_pairs", 
                    "source_arg": "input_pairs", 
                    "step_name": "merge-pairs"
                }
            ], 
            "name": "merge-pairs", 
            "out": [
                {
                    "arg_name": "merged_pairs", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "pairs", 
                    "fdn_type": "data file", 
                    "id": "#merge-pairs/merged_pairs", 
                    "name": "merge-pairs.merged_pairs", 
                    "step_name": "merge-pairs"
                }
            ], 
            "run": "merge-pairs.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "annotation"
                ], 
                "description": "Adding restriction enzyme site information to the pairs file", 
                "software_used": [
                    "pairix_0.3.3"
                ]
            }, 
            "id": "#addfragtopairs", 
            "in": [
                {
                    "arg_name": "input_pairs", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "pairs", 
                    "fdn_type": "data file", 
                    "id": "#addfragtopairs/input_pairs", 
                    "name": "addfragtopairs.input_pairs", 
                    "source": "#merge-pairs/merged_pairs", 
                    "source_arg": "merged_pairs", 
                    "source_step": "merge-pairs", 
                    "step_name": "addfragtopairs"
                }, 
                {
                    "arg_name": "restriction_file", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "juicer_format_restriction_site_file", 
                    "fdn_type": "reference file", 
                    "id": "#addfragtopairs/restriction_file", 
                    "name": "addfragtopairs.restriction_file", 
                    "source": "#restriction_file", 
                    "source_arg": "restriction_file", 
                    "step_name": "addfragtopairs"
                }, 
                {
                    "arg_name": "donothing", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#addfragtopairs/donothing", 
                    "name": "addfragtopairs.donothing", 
                    "source": "#nofrag", 
                    "source_arg": "nofrag", 
                    "step_name": "addfragtopairs"
                }
            ], 
            "name": "addfragtopairs", 
            "out": [
                {
                    "arg_name": "pairs_with_frags", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "pairs", 
                    "fdn_type": "data file", 
                    "id": "#addfragtopairs/pairs_with_frags", 
                    "name": "addfragtopairs.pairs_with_frags", 
                    "step_name": "addfragtopairs"
                }
            ], 
            "run": "addfragtopairs.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "aggregation"
                ], 
                "description": "Merged Pairs file is processed using Cooler", 
                "software_used": [
                    "cooler_0.7.6"
                ]
            }, 
            "id": "#cooler", 
            "in": [
                {
                    "arg_name": "pairs", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "pairs", 
                    "fdn_type": "data file", 
                    "id": "#cooler/pairs", 
                    "name": "cooler.pairs", 
                    "source": "#merge-pairs/merged_pairs", 
                    "source_arg": "merged_pairs", 
                    "source_step": "merge-pairs", 
                    "step_name": "cooler"
                }, 
                {
                    "arg_name": "chrsizes", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "chromsizes", 
                    "fdn_type": "reference file", 
                    "id": "#cooler/chrsizes", 
                    "name": "cooler.chrsizes", 
                    "source": "#chromsizes", 
                    "source_arg": "chromsizes", 
                    "step_name": "cooler"
                }, 
                {
                    "arg_name": "binsize", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#cooler/binsize", 
                    "name": "cooler.binsize", 
                    "source": "#min_res", 
                    "source_arg": "min_res", 
                    "step_name": "cooler"
                }, 
                {
                    "arg_name": "ncores", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#cooler/ncores", 
                    "name": "cooler.ncores", 
                    "source": "#nthreads", 
                    "source_arg": "nthreads", 
                    "step_name": "cooler"
                }, 
                {
                    "arg_name": "max_split", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#cooler/max_split", 
                    "name": "cooler.max_split", 
                    "source": "#max_split_cooler", 
                    "source_arg": "max_split_cooler", 
                    "step_name": "cooler"
                }
            ], 
            "name": "cooler", 
            "out": [
                {
                    "arg_name": "cool", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "cool", 
                    "fdn_type": "data file", 
                    "id": "#cooler/cool", 
                    "name": "cooler.cool", 
                    "step_name": "cooler"
                }
            ], 
            "run": "cooler.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "aggregation", 
                    "normalization"
                ], 
                "description": "Merged Pairs file is processed using Juicebox", 
                "software_used": [
                    "juicer_tools_1.8.9-cuda8"
                ]
            }, 
            "id": "#pairs2hic", 
            "in": [
                {
                    "arg_name": "input_pairs", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "pairs", 
                    "fdn_type": "data file", 
                    "id": "#pairs2hic/input_pairs", 
                    "name": "pairs2hic.input_pairs", 
                    "source": "#addfragtopairs/pairs_with_frags", 
                    "source_arg": "pairs_with_frags", 
                    "source_step": "addfragtopairs", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "chromsizes", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "chromsizes", 
                    "fdn_type": "reference file", 
                    "id": "#pairs2hic/chromsizes", 
                    "name": "pairs2hic.chromsizes", 
                    "source": "#chromsizes", 
                    "source_arg": "chromsizes", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "min_res", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#pairs2hic/min_res", 
                    "name": "pairs2hic.min_res", 
                    "source": "#min_res", 
                    "source_arg": "min_res", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "higlass", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#pairs2hic/higlass", 
                    "name": "pairs2hic.higlass", 
                    "source": "#higlass", 
                    "source_arg": "higlass", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "custom_res", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#pairs2hic/custom_res", 
                    "name": "pairs2hic.custom_res", 
                    "source": "#custom_res", 
                    "source_arg": "custom_res", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "maxmem", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#pairs2hic/maxmem", 
                    "name": "pairs2hic.maxmem", 
                    "source": "#maxmem", 
                    "source_arg": "maxmem", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "mapqfilter", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#pairs2hic/mapqfilter", 
                    "name": "pairs2hic.mapqfilter", 
                    "source": "#mapqfilter_juicer", 
                    "source_arg": "mapqfilter_juicer", 
                    "step_name": "pairs2hic"
                }
            ], 
            "name": "pairs2hic", 
            "out": [
                {
                    "arg_name": "hic", 
                    "id": "#pairs2hic/hic", 
                    "name": "pairs2hic.hic", 
                    "step_name": "pairs2hic"
                }
            ], 
            "run": "pairs2hic.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "aggregation", 
                    "normalization", 
                    "file format conversion"
                ], 
                "description": "Cooler file is converted to mcool", 
                "software_used": [
                    "cooler_0.7.6"
                ]
            }, 
            "id": "#cool2mcool", 
            "in": [
                {
                    "arg_name": "input_cool", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "cool", 
                    "fdn_type": "data file", 
                    "id": "#cool2mcool/input_cool", 
                    "name": "cool2mcool.input_cool", 
                    "source": "#cooler/cool", 
                    "source_arg": "cool", 
                    "source_step": "cooler", 
                    "step_name": "cool2mcool"
                }, 
                {
                    "arg_name": "ncores", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#cool2mcool/ncores", 
                    "name": "cool2mcool.ncores", 
                    "source": "#nthreads", 
                    "source_arg": "nthreads", 
                    "step_name": "cool2mcool"
                }, 
                {
                    "arg_name": "chunksize", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#cool2mcool/chunksize", 
                    "name": "cool2mcool.chunksize", 
                    "source": "#chunksize", 
                    "source_arg": "chunksize", 
                    "step_name": "cool2mcool"
                }, 
                {
                    "arg_name": "juicer_res", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#cool2mcool/juicer_res", 
                    "name": "cool2mcool.juicer_res", 
                    "source": "#juicer_res", 
                    "source_arg": "juicer_res", 
                    "step_name": "cool2mcool"
                }, 
                {
                    "arg_name": "custom_res", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#cool2mcool/custom_res", 
                    "name": "cool2mcool.custom_res", 
                    "source": "#custom_res", 
                    "source_arg": "custom_res", 
                    "step_name": "cool2mcool"
                }
            ], 
            "name": "cool2mcool", 
            "out": [
                {
                    "arg_name": "mcool", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "mcool", 
                    "fdn_type": "data file", 
                    "id": "#cool2mcool/mcool", 
                    "name": "cool2mcool.mcool", 
                    "step_name": "cool2mcool"
                }
            ], 
            "run": "cool2mcool.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "file format conversion"
                ], 
                "description": "HiC normalization vector is added to mcooler", 
                "software_used": [
                    "hic2cool_0.4.1"
                ]
            }, 
            "id": "#add-hic-normvector-to-mcool", 
            "in": [
                {
                    "arg_name": "input_mcool", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "mcool", 
                    "fdn_type": "data file", 
                    "id": "#add-hic-normvector-to-mcool/input_mcool", 
                    "name": "add-hic-normvector-to-mcool.input_mcool", 
                    "source": "#cool2mcool/mcool", 
                    "source_arg": "mcool", 
                    "source_step": "cool2mcool", 
                    "step_name": "add-hic-normvector-to-mcool"
                }, 
                {
                    "arg_name": "input_hic", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "hic", 
                    "fdn_type": "data file", 
                    "id": "#add-hic-normvector-to-mcool/input_hic", 
                    "name": "add-hic-normvector-to-mcool.input_hic", 
                    "source": "#pairs2hic/hic", 
                    "source_arg": "hic", 
                    "source_step": "pairs2hic", 
                    "step_name": "add-hic-normvector-to-mcool"
                }
            ], 
            "name": "add-hic-normvector-to-mcool", 
            "out": [
                {
                    "arg_name": "mcool_with_hicnorm", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "mcool", 
                    "fdn_type": "data file", 
                    "id": "#add-hic-normvector-to-mcool/mcool_with_hicnorm", 
                    "name": "add-hic-normvector-to-mcool.mcool_with_hicnorm", 
                    "step_name": "add-hic-normvector-to-mcool"
                }
            ], 
            "run": "add-hic-normvector-to-mcool.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "file format conversion"
                ], 
                "description": "Extracting HiC normalization vector", 
                "software_used": [
                    "mcool2hic_87a912"
                ]
            }, 
            "id": "#extract-mcool-normvector-for-juicebox", 
            "in": [
                {
                    "arg_name": "custom_res", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#extract-mcool-normvector-for-juicebox/custom_res", 
                    "name": "extract-mcool-normvector-for-juicebox.custom_res", 
                    "source": "#custom_res", 
                    "source_arg": "custom_res", 
                    "step_name": "extract-mcool-normvector-for-juicebox"
                }, 
                {
                    "arg_name": "chromsize", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "chromsizes", 
                    "fdn_type": "reference file", 
                    "id": "#extract-mcool-normvector-for-juicebox/chromsize", 
                    "name": "extract-mcool-normvector-for-juicebox.chromsize", 
                    "source": "#chromsizes", 
                    "source_arg": "chromsizes", 
                    "step_name": "extract-mcool-normvector-for-juicebox"
                }, 
                {
                    "arg_name": "mcool", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "mcool", 
                    "fdn_type": "data file", 
                    "id": "#extract-mcool-normvector-for-juicebox/mcool", 
                    "name": "extract-mcool-normvector-for-juicebox.mcool", 
                    "source": "#add-hic-normvector-to-mcool/mcool_with_hicnorm", 
                    "source_arg": "mcool_with_hicnorm", 
                    "source_step": "add-hic-normvector-to-mcool", 
                    "step_name": "extract-mcool-normvector-for-juicebox"
                }
            ], 
            "name": "extract-mcool-normvector-for-juicebox", 
            "out": [
                {
                    "arg_name": "cooler_normvector", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "normvector_juicerformat", 
                    "fdn_type": "data file", 
                    "id": "#extract-mcool-normvector-for-juicebox/cooler_normvector", 
                    "name": "extract-mcool-normvector-for-juicebox.cooler_normvector", 
                    "step_name": "extract-mcool-normvector-for-juicebox"
                }
            ], 
            "run": "extract-mcool-normvector-for-juicebox.cwl"
        }
    ]
}