{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#chrsizes", 
            "isArray": false, 
            "isFile": true, 
            "name": "chrsizes", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
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
            "id": "#binsize", 
            "isArray": false, 
            "isFile": false, 
            "name": "binsize", 
            "type": [
                "null", 
                "int"
            ]
        }, 
        {
            "default": 8, 
            "id": "#ncores", 
            "isArray": false, 
            "isFile": false, 
            "name": "ncores", 
            "type": [
                "null", 
                "int"
            ]
        }, 
        {
            "default": 5000, 
            "id": "#min_res", 
            "isArray": false, 
            "isFile": false, 
            "name": "min_res", 
            "type": [
                "null", 
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
                "null", 
                "string"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#output_pairs", 
            "isArray": false, 
            "isFile": true, 
            "name": "output_pairs", 
            "outputSource": "#merge_pairs/output_pairs", 
            "source_arg": "output_pairs", 
            "source_step": "merge_pairs", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#out_cool", 
            "isArray": false, 
            "isFile": true, 
            "name": "out_cool", 
            "outputSource": "#cooler/out_cool", 
            "source_arg": "out_cool", 
            "source_step": "cooler", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#output_hic", 
            "isArray": false, 
            "isFile": true, 
            "name": "output_hic", 
            "outputSource": "#pairs2hic/output_hic", 
            "source_arg": "output_hic", 
            "source_step": "pairs2hic", 
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
            "source_arg": "output_pairs", 
            "source_step": "merge_pairs", 
            "target_arg": "output_pairs"
        }, 
        {
            "source_arg": "out_cool", 
            "source_step": "cooler", 
            "target_arg": "out_cool"
        }, 
        {
            "source_arg": "output_hic", 
            "source_step": "pairs2hic", 
            "target_arg": "output_hic"
        }, 
        {
            "target_arg": "outprefix", 
            "target_step": "merge_pairs"
        }, 
        {
            "source_arg": "input_pairs", 
            "target_arg": "input_pairs", 
            "target_step": "merge_pairs"
        }, 
        {
            "source_arg": "output_pairs", 
            "source_step": "merge_pairs", 
            "target_arg": "pairs", 
            "target_step": "cooler"
        }, 
        {
            "source_arg": "chrsizes", 
            "target_arg": "chrsizes", 
            "target_step": "cooler"
        }, 
        {
            "source_arg": "binsize", 
            "target_arg": "binsize", 
            "target_step": "cooler"
        }, 
        {
            "target_arg": "outprefix", 
            "target_step": "cooler"
        }, 
        {
            "source_arg": "ncores", 
            "target_arg": "ncores", 
            "target_step": "cooler"
        }, 
        {
            "target_arg": "max_split", 
            "target_step": "cooler"
        }, 
        {
            "source_arg": "output_pairs", 
            "source_step": "merge_pairs", 
            "target_arg": "input_pairs", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "chrsizes", 
            "target_arg": "chromsizes_file", 
            "target_step": "pairs2hic"
        }, 
        {
            "target_arg": "output_prefix", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "min_res", 
            "target_arg": "min_res", 
            "target_step": "pairs2hic"
        }, 
        {
            "target_arg": "higlass", 
            "target_step": "pairs2hic"
        }, 
        {
            "source_arg": "maxmem", 
            "target_arg": "maxmem", 
            "target_step": "pairs2hic"
        }
    ], 
    "steps": [
        {
            "id": "#merge_pairs", 
            "in": [
                {
                    "arg_name": "outprefix", 
                    "id": "#merge_pairs/outprefix", 
                    "name": "merge_pairs.outprefix", 
                    "step_name": "merge_pairs"
                }, 
                {
                    "arg_name": "input_pairs", 
                    "id": "#merge_pairs/input_pairs", 
                    "name": "merge_pairs.input_pairs", 
                    "source": "#input_pairs", 
                    "source_arg": "input_pairs", 
                    "step_name": "merge_pairs"
                }
            ], 
            "name": "merge_pairs", 
            "out": [
                {
                    "arg_name": "output_pairs", 
                    "id": "#merge_pairs/output_pairs", 
                    "name": "merge_pairs.output_pairs", 
                    "step_name": "merge_pairs"
                }
            ], 
            "run": "merge-pairs.cwl"
        }, 
        {
            "id": "#cooler", 
            "in": [
                {
                    "arg_name": "pairs", 
                    "id": "#cooler/pairs", 
                    "name": "cooler.pairs", 
                    "source": "#merge_pairs/output_pairs", 
                    "source_arg": "output_pairs", 
                    "source_step": "merge_pairs", 
                    "step_name": "cooler"
                }, 
                {
                    "arg_name": "chrsizes", 
                    "id": "#cooler/chrsizes", 
                    "name": "cooler.chrsizes", 
                    "source": "#chrsizes", 
                    "source_arg": "chrsizes", 
                    "step_name": "cooler"
                }, 
                {
                    "arg_name": "binsize", 
                    "id": "#cooler/binsize", 
                    "name": "cooler.binsize", 
                    "source": "#binsize", 
                    "source_arg": "binsize", 
                    "step_name": "cooler"
                }, 
                {
                    "arg_name": "outprefix", 
                    "id": "#cooler/outprefix", 
                    "name": "cooler.outprefix", 
                    "step_name": "cooler"
                }, 
                {
                    "arg_name": "ncores", 
                    "id": "#cooler/ncores", 
                    "name": "cooler.ncores", 
                    "source": "#ncores", 
                    "source_arg": "ncores", 
                    "step_name": "cooler"
                }, 
                {
                    "arg_name": "max_split", 
                    "id": "#cooler/max_split", 
                    "name": "cooler.max_split", 
                    "step_name": "cooler"
                }
            ], 
            "name": "cooler", 
            "out": [
                {
                    "arg_name": "out_cool", 
                    "id": "#cooler/out_cool", 
                    "name": "cooler.out_cool", 
                    "step_name": "cooler"
                }
            ], 
            "run": "cooler.cwl"
        }, 
        {
            "id": "#pairs2hic", 
            "in": [
                {
                    "arg_name": "input_pairs", 
                    "id": "#pairs2hic/input_pairs", 
                    "name": "pairs2hic.input_pairs", 
                    "source": "#merge_pairs/output_pairs", 
                    "source_arg": "output_pairs", 
                    "source_step": "merge_pairs", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "chromsizes_file", 
                    "id": "#pairs2hic/chromsizes_file", 
                    "name": "pairs2hic.chromsizes_file", 
                    "source": "#chrsizes", 
                    "source_arg": "chrsizes", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "output_prefix", 
                    "id": "#pairs2hic/output_prefix", 
                    "name": "pairs2hic.output_prefix", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "min_res", 
                    "id": "#pairs2hic/min_res", 
                    "name": "pairs2hic.min_res", 
                    "source": "#min_res", 
                    "source_arg": "min_res", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "higlass", 
                    "id": "#pairs2hic/higlass", 
                    "name": "pairs2hic.higlass", 
                    "step_name": "pairs2hic"
                }, 
                {
                    "arg_name": "maxmem", 
                    "id": "#pairs2hic/maxmem", 
                    "name": "pairs2hic.maxmem", 
                    "source": "#maxmem", 
                    "source_arg": "maxmem", 
                    "step_name": "pairs2hic"
                }
            ], 
            "name": "pairs2hic", 
            "out": [
                {
                    "arg_name": "output_hic", 
                    "id": "#pairs2hic/output_hic", 
                    "name": "pairs2hic.output_hic", 
                    "step_name": "pairs2hic"
                }
            ], 
            "run": "pairs2hic.cwl"
        }
    ]
}