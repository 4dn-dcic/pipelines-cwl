{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#input_merged_nodups", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#chromsize", 
            "type": [
                "null", 
                "File"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#output_pairs_index", 
            "outputSource": "#hic_pairs_to_end/output_pairs_index", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#output_pairs", 
            "outputSource": "#hic_pairs_to_end/output_pairs", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#output_normvector", 
            "outputSource": "#hic_pairs_to_end/output_normvector", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#output_mcool", 
            "outputSource": "#hic_pairs_to_end/output_mcool", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#output_hic", 
            "outputSource": "#hic_pairs_to_end/output_hic", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#out_pairs_px", 
            "outputSource": "#oldjuicer2pairs/out_pairs_px", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#out_pairs", 
            "outputSource": "#oldjuicer2pairs/out_pairs", 
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
            "id": "#oldjuicer2pairs", 
            "in": [
                {
                    "arg_name": "input_merged_nodups", 
                    "id": "#oldjuicer2pairs/input_merged_nodups", 
                    "source": "#input_merged_nodups"
                }, 
                {
                    "arg_name": "chromsize", 
                    "id": "#oldjuicer2pairs/chromsize", 
                    "source": "#chromsize"
                }, 
                {
                    "arg_name": "nsplit", 
                    "id": "#oldjuicer2pairs/nsplit"
                }, 
                {
                    "arg_name": "outprefix", 
                    "id": "#oldjuicer2pairs/outprefix"
                }, 
                {
                    "arg_name": "max_remove_mapq", 
                    "id": "#oldjuicer2pairs/max_remove_mapq"
                }
            ], 
            "out": [
                {
                    "arg_name": "out_pairs", 
                    "id": "#oldjuicer2pairs/out_pairs"
                }, 
                {
                    "arg_name": "out_pairs_px", 
                    "id": "#oldjuicer2pairs/out_pairs_px"
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
                    "source": "#oldjuicer2pairs/out_pairs"
                }, 
                {
                    "arg_name": "input_pairs", 
                    "id": "#hic_pairs_to_end/input_pairs", 
                    "source": "#oldjuicer2pairs/out_pairs_px"
                }, 
                {
                    "arg_name": "ncores", 
                    "id": "#hic_pairs_to_end/ncores"
                }, 
                {
                    "arg_name": "min_res", 
                    "id": "#hic_pairs_to_end/min_res"
                }, 
                {
                    "arg_name": "binsize", 
                    "id": "#hic_pairs_to_end/binsize"
                }, 
                {
                    "arg_name": "ncores_1", 
                    "id": "#hic_pairs_to_end/ncores_1"
                }, 
                {
                    "arg_name": "nres", 
                    "id": "#hic_pairs_to_end/nres"
                }
            ], 
            "out": [
                {
                    "arg_name": "output_pairs", 
                    "id": "#hic_pairs_to_end/output_pairs"
                }, 
                {
                    "arg_name": "output_mcool", 
                    "id": "#hic_pairs_to_end/output_mcool"
                }, 
                {
                    "arg_name": "output_normvector", 
                    "id": "#hic_pairs_to_end/output_normvector"
                }, 
                {
                    "arg_name": "output_hic", 
                    "id": "#hic_pairs_to_end/output_hic"
                }, 
                {
                    "arg_name": "output_pairs_index", 
                    "id": "#hic_pairs_to_end/output_pairs_index"
                }
            ], 
            "run": "hic-pairs-to-end.cwl"
        }
    ]
}