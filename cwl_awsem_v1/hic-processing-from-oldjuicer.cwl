{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#input_merged_nodups", 
            "isArray": false, 
            "isFile": true, 
            "name": "input_merged_nodups", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#chromsize", 
            "isArray": false, 
            "isFile": true, 
            "name": "chromsize", 
            "type": [
                "null", 
                "File"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#output_pairs_index", 
            "isArray": false, 
            "isFile": true, 
            "name": "output_pairs_index", 
            "outputSource": "#hic_pairs_to_end/output_pairs_index", 
            "source_arg": "output_pairs_index", 
            "source_step": "hic_pairs_to_end", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#output_pairs", 
            "isArray": false, 
            "isFile": true, 
            "name": "output_pairs", 
            "outputSource": "#hic_pairs_to_end/output_pairs", 
            "source_arg": "output_pairs", 
            "source_step": "hic_pairs_to_end", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#output_normvector", 
            "isArray": false, 
            "isFile": true, 
            "name": "output_normvector", 
            "outputSource": "#hic_pairs_to_end/output_normvector", 
            "source_arg": "output_normvector", 
            "source_step": "hic_pairs_to_end", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#output_mcool", 
            "isArray": false, 
            "isFile": true, 
            "name": "output_mcool", 
            "outputSource": "#hic_pairs_to_end/output_mcool", 
            "source_arg": "output_mcool", 
            "source_step": "hic_pairs_to_end", 
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
            "outputSource": "#hic_pairs_to_end/output_hic", 
            "source_arg": "output_hic", 
            "source_step": "hic_pairs_to_end", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#out_pairs_px", 
            "isArray": false, 
            "isFile": true, 
            "name": "out_pairs_px", 
            "outputSource": "#oldjuicer2pairs/out_pairs_px", 
            "source_arg": "out_pairs_px", 
            "source_step": "oldjuicer2pairs", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#out_pairs", 
            "isArray": false, 
            "isFile": true, 
            "name": "out_pairs", 
            "outputSource": "#oldjuicer2pairs/out_pairs", 
            "source_arg": "out_pairs", 
            "source_step": "oldjuicer2pairs", 
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
            "source_arg": "output_pairs_index", 
            "source_step": "hic_pairs_to_end", 
            "target_arg": "output_pairs_index"
        }, 
        {
            "source_arg": "output_pairs", 
            "source_step": "hic_pairs_to_end", 
            "target_arg": "output_pairs"
        }, 
        {
            "source_arg": "output_normvector", 
            "source_step": "hic_pairs_to_end", 
            "target_arg": "output_normvector"
        }, 
        {
            "source_arg": "output_mcool", 
            "source_step": "hic_pairs_to_end", 
            "target_arg": "output_mcool"
        }, 
        {
            "source_arg": "output_hic", 
            "source_step": "hic_pairs_to_end", 
            "target_arg": "output_hic"
        }, 
        {
            "source_arg": "out_pairs_px", 
            "source_step": "oldjuicer2pairs", 
            "target_arg": "out_pairs_px"
        }, 
        {
            "source_arg": "out_pairs", 
            "source_step": "oldjuicer2pairs", 
            "target_arg": "out_pairs"
        }, 
        {
            "source_arg": "input_merged_nodups", 
            "target_arg": "input_merged_nodups", 
            "target_step": "oldjuicer2pairs"
        }, 
        {
            "source_arg": "chromsize", 
            "target_arg": "chromsize", 
            "target_step": "oldjuicer2pairs"
        }, 
        {
            "target_arg": "nsplit", 
            "target_step": "oldjuicer2pairs"
        }, 
        {
            "target_arg": "outprefix", 
            "target_step": "oldjuicer2pairs"
        }, 
        {
            "target_arg": "max_remove_mapq", 
            "target_step": "oldjuicer2pairs"
        }, 
        {
            "source_arg": "out_pairs", 
            "source_step": "oldjuicer2pairs", 
            "target_arg": "chrsizes", 
            "target_step": "hic_pairs_to_end"
        }, 
        {
            "source_arg": "out_pairs_px", 
            "source_step": "oldjuicer2pairs", 
            "target_arg": "input_pairs", 
            "target_step": "hic_pairs_to_end"
        }, 
        {
            "target_arg": "ncores", 
            "target_step": "hic_pairs_to_end"
        }, 
        {
            "target_arg": "min_res", 
            "target_step": "hic_pairs_to_end"
        }, 
        {
            "target_arg": "binsize", 
            "target_step": "hic_pairs_to_end"
        }, 
        {
            "target_arg": "ncores_1", 
            "target_step": "hic_pairs_to_end"
        }, 
        {
            "target_arg": "nres", 
            "target_step": "hic_pairs_to_end"
        }
    ], 
    "steps": [
        {
            "id": "#oldjuicer2pairs", 
            "in": [
                {
                    "arg_name": "input_merged_nodups", 
                    "id": "#oldjuicer2pairs/input_merged_nodups", 
                    "name": "oldjuicer2pairs.input_merged_nodups", 
                    "source": "#input_merged_nodups", 
                    "source_arg": "input_merged_nodups", 
                    "step_name": "oldjuicer2pairs"
                }, 
                {
                    "arg_name": "chromsize", 
                    "id": "#oldjuicer2pairs/chromsize", 
                    "name": "oldjuicer2pairs.chromsize", 
                    "source": "#chromsize", 
                    "source_arg": "chromsize", 
                    "step_name": "oldjuicer2pairs"
                }, 
                {
                    "arg_name": "nsplit", 
                    "id": "#oldjuicer2pairs/nsplit", 
                    "name": "oldjuicer2pairs.nsplit", 
                    "step_name": "oldjuicer2pairs"
                }, 
                {
                    "arg_name": "outprefix", 
                    "id": "#oldjuicer2pairs/outprefix", 
                    "name": "oldjuicer2pairs.outprefix", 
                    "step_name": "oldjuicer2pairs"
                }, 
                {
                    "arg_name": "max_remove_mapq", 
                    "id": "#oldjuicer2pairs/max_remove_mapq", 
                    "name": "oldjuicer2pairs.max_remove_mapq", 
                    "step_name": "oldjuicer2pairs"
                }
            ], 
            "name": "oldjuicer2pairs", 
            "out": [
                {
                    "arg_name": "out_pairs", 
                    "id": "#oldjuicer2pairs/out_pairs", 
                    "name": "oldjuicer2pairs.out_pairs", 
                    "step_name": "oldjuicer2pairs"
                }, 
                {
                    "arg_name": "out_pairs_px", 
                    "id": "#oldjuicer2pairs/out_pairs_px", 
                    "name": "oldjuicer2pairs.out_pairs_px", 
                    "step_name": "oldjuicer2pairs"
                }
            ], 
            "run": "oldjuicer2pairs.cwl"
        }, 
        {
            "id": "#hic_pairs_to_end", 
            "in": [
                {
                    "arg_name": "chrsizes", 
                    "id": "#hic_pairs_to_end/chrsizes", 
                    "name": "hic_pairs_to_end.chrsizes", 
                    "source": "#oldjuicer2pairs/out_pairs", 
                    "source_arg": "out_pairs", 
                    "source_step": "oldjuicer2pairs", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "input_pairs", 
                    "id": "#hic_pairs_to_end/input_pairs", 
                    "name": "hic_pairs_to_end.input_pairs", 
                    "source": "#oldjuicer2pairs/out_pairs_px", 
                    "source_arg": "out_pairs_px", 
                    "source_step": "oldjuicer2pairs", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "ncores", 
                    "id": "#hic_pairs_to_end/ncores", 
                    "name": "hic_pairs_to_end.ncores", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "min_res", 
                    "id": "#hic_pairs_to_end/min_res", 
                    "name": "hic_pairs_to_end.min_res", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "binsize", 
                    "id": "#hic_pairs_to_end/binsize", 
                    "name": "hic_pairs_to_end.binsize", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "ncores_1", 
                    "id": "#hic_pairs_to_end/ncores_1", 
                    "name": "hic_pairs_to_end.ncores_1", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "nres", 
                    "id": "#hic_pairs_to_end/nres", 
                    "name": "hic_pairs_to_end.nres", 
                    "step_name": "hic_pairs_to_end"
                }
            ], 
            "name": "hic_pairs_to_end", 
            "out": [
                {
                    "arg_name": "output_pairs", 
                    "id": "#hic_pairs_to_end/output_pairs", 
                    "name": "hic_pairs_to_end.output_pairs", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "output_mcool", 
                    "id": "#hic_pairs_to_end/output_mcool", 
                    "name": "hic_pairs_to_end.output_mcool", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "output_normvector", 
                    "id": "#hic_pairs_to_end/output_normvector", 
                    "name": "hic_pairs_to_end.output_normvector", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "output_hic", 
                    "id": "#hic_pairs_to_end/output_hic", 
                    "name": "hic_pairs_to_end.output_hic", 
                    "step_name": "hic_pairs_to_end"
                }, 
                {
                    "arg_name": "output_pairs_index", 
                    "id": "#hic_pairs_to_end/output_pairs_index", 
                    "name": "hic_pairs_to_end.output_pairs_index", 
                    "step_name": "hic_pairs_to_end"
                }
            ], 
            "run": "hic-pairs-to-end.cwl"
        }
    ]
}