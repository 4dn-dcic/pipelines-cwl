{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#input_cool", 
            "isArray": false, 
            "isFile": true, 
            "name": "input_cool", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#input_hic", 
            "isArray": false, 
            "isFile": true, 
            "name": "input_hic", 
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
        }, 
        {
            "default": 13, 
            "id": "#nres", 
            "isArray": false, 
            "isFile": false, 
            "name": "nres", 
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
            "default": 4, 
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
            "default": 10000000, 
            "id": "#chunksize", 
            "isArray": false, 
            "isFile": false, 
            "name": "chunksize", 
            "type": [
                "null", 
                "int"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#output_mcool", 
            "isArray": false, 
            "isFile": true, 
            "name": "output_mcool", 
            "outputSource": "#add_hic_normvector_to_mcool/output_mcool", 
            "source_arg": "output_mcool", 
            "source_step": "add_hic_normvector_to_mcool", 
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
            "outputSource": "#extract_mcool_normvector_for_juicebox/output_normvector", 
            "source_arg": "output_normvector", 
            "source_step": "extract_mcool_normvector_for_juicebox", 
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
            "source_arg": "output_mcool", 
            "source_step": "add_hic_normvector_to_mcool", 
            "target_arg": "output_mcool"
        }, 
        {
            "source_arg": "output_normvector", 
            "source_step": "extract_mcool_normvector_for_juicebox", 
            "target_arg": "output_normvector"
        }, 
        {
            "target_arg": "outdir", 
            "target_step": "add_hic_normvector_to_mcool"
        }, 
        {
            "source_arg": "output_mcool", 
            "source_step": "cool2mcool", 
            "target_arg": "input_mcool", 
            "target_step": "add_hic_normvector_to_mcool"
        }, 
        {
            "source_arg": "input_hic", 
            "target_arg": "input_hic", 
            "target_step": "add_hic_normvector_to_mcool"
        }, 
        {
            "target_arg": "output_prefix", 
            "target_step": "extract_mcool_normvector_for_juicebox"
        }, 
        {
            "target_arg": "outdir", 
            "target_step": "extract_mcool_normvector_for_juicebox"
        }, 
        {
            "source_arg": "nres", 
            "target_arg": "nres", 
            "target_step": "extract_mcool_normvector_for_juicebox"
        }, 
        {
            "source_arg": "min_res", 
            "target_arg": "min_res", 
            "target_step": "extract_mcool_normvector_for_juicebox"
        }, 
        {
            "source_arg": "chromsize", 
            "target_arg": "chromsize", 
            "target_step": "extract_mcool_normvector_for_juicebox"
        }, 
        {
            "source_arg": "output_mcool", 
            "source_step": "add_hic_normvector_to_mcool", 
            "target_arg": "input_mcool", 
            "target_step": "extract_mcool_normvector_for_juicebox"
        }, 
        {
            "source_arg": "input_cool", 
            "target_arg": "input_cool", 
            "target_step": "cool2mcool"
        }, 
        {
            "source_arg": "ncores", 
            "target_arg": "ncores", 
            "target_step": "cool2mcool"
        }, 
        {
            "source_arg": "chunksize", 
            "target_arg": "chunksize", 
            "target_step": "cool2mcool"
        }, 
        {
            "target_arg": "outprefix", 
            "target_step": "cool2mcool"
        }
    ], 
    "steps": [
        {
            "id": "#add_hic_normvector_to_mcool", 
            "in": [
                {
                    "arg_name": "outdir", 
                    "id": "#add_hic_normvector_to_mcool/outdir", 
                    "name": "add_hic_normvector_to_mcool.outdir", 
                    "step_name": "add_hic_normvector_to_mcool"
                }, 
                {
                    "arg_name": "input_mcool", 
                    "id": "#add_hic_normvector_to_mcool/input_mcool", 
                    "name": "add_hic_normvector_to_mcool.input_mcool", 
                    "source": "#cool2mcool/output_mcool", 
                    "source_arg": "output_mcool", 
                    "source_step": "cool2mcool", 
                    "step_name": "add_hic_normvector_to_mcool"
                }, 
                {
                    "arg_name": "input_hic", 
                    "id": "#add_hic_normvector_to_mcool/input_hic", 
                    "name": "add_hic_normvector_to_mcool.input_hic", 
                    "source": "#input_hic", 
                    "source_arg": "input_hic", 
                    "step_name": "add_hic_normvector_to_mcool"
                }
            ], 
            "name": "add_hic_normvector_to_mcool", 
            "out": [
                {
                    "arg_name": "output_mcool", 
                    "id": "#add_hic_normvector_to_mcool/output_mcool", 
                    "name": "add_hic_normvector_to_mcool.output_mcool", 
                    "step_name": "add_hic_normvector_to_mcool"
                }
            ], 
            "run": "add-hic-normvector-to-mcool.cwl"
        }, 
        {
            "id": "#extract_mcool_normvector_for_juicebox", 
            "in": [
                {
                    "arg_name": "output_prefix", 
                    "id": "#extract_mcool_normvector_for_juicebox/output_prefix", 
                    "name": "extract_mcool_normvector_for_juicebox.output_prefix", 
                    "step_name": "extract_mcool_normvector_for_juicebox"
                }, 
                {
                    "arg_name": "outdir", 
                    "id": "#extract_mcool_normvector_for_juicebox/outdir", 
                    "name": "extract_mcool_normvector_for_juicebox.outdir", 
                    "step_name": "extract_mcool_normvector_for_juicebox"
                }, 
                {
                    "arg_name": "nres", 
                    "id": "#extract_mcool_normvector_for_juicebox/nres", 
                    "name": "extract_mcool_normvector_for_juicebox.nres", 
                    "source": "#nres", 
                    "source_arg": "nres", 
                    "step_name": "extract_mcool_normvector_for_juicebox"
                }, 
                {
                    "arg_name": "min_res", 
                    "id": "#extract_mcool_normvector_for_juicebox/min_res", 
                    "name": "extract_mcool_normvector_for_juicebox.min_res", 
                    "source": "#min_res", 
                    "source_arg": "min_res", 
                    "step_name": "extract_mcool_normvector_for_juicebox"
                }, 
                {
                    "arg_name": "chromsize", 
                    "id": "#extract_mcool_normvector_for_juicebox/chromsize", 
                    "name": "extract_mcool_normvector_for_juicebox.chromsize", 
                    "source": "#chromsize", 
                    "source_arg": "chromsize", 
                    "step_name": "extract_mcool_normvector_for_juicebox"
                }, 
                {
                    "arg_name": "input_mcool", 
                    "id": "#extract_mcool_normvector_for_juicebox/input_mcool", 
                    "name": "extract_mcool_normvector_for_juicebox.input_mcool", 
                    "source": "#add_hic_normvector_to_mcool/output_mcool", 
                    "source_arg": "output_mcool", 
                    "source_step": "add_hic_normvector_to_mcool", 
                    "step_name": "extract_mcool_normvector_for_juicebox"
                }
            ], 
            "name": "extract_mcool_normvector_for_juicebox", 
            "out": [
                {
                    "arg_name": "output_normvector", 
                    "id": "#extract_mcool_normvector_for_juicebox/output_normvector", 
                    "name": "extract_mcool_normvector_for_juicebox.output_normvector", 
                    "step_name": "extract_mcool_normvector_for_juicebox"
                }
            ], 
            "run": "extract-mcool-normvector-for-juicebox.cwl"
        }, 
        {
            "id": "#cool2mcool", 
            "in": [
                {
                    "arg_name": "input_cool", 
                    "id": "#cool2mcool/input_cool", 
                    "name": "cool2mcool.input_cool", 
                    "source": "#input_cool", 
                    "source_arg": "input_cool", 
                    "step_name": "cool2mcool"
                }, 
                {
                    "arg_name": "ncores", 
                    "id": "#cool2mcool/ncores", 
                    "name": "cool2mcool.ncores", 
                    "source": "#ncores", 
                    "source_arg": "ncores", 
                    "step_name": "cool2mcool"
                }, 
                {
                    "arg_name": "chunksize", 
                    "id": "#cool2mcool/chunksize", 
                    "name": "cool2mcool.chunksize", 
                    "source": "#chunksize", 
                    "source_arg": "chunksize", 
                    "step_name": "cool2mcool"
                }, 
                {
                    "arg_name": "outprefix", 
                    "id": "#cool2mcool/outprefix", 
                    "name": "cool2mcool.outprefix", 
                    "step_name": "cool2mcool"
                }
            ], 
            "name": "cool2mcool", 
            "out": [
                {
                    "arg_name": "output_mcool", 
                    "id": "#cool2mcool/output_mcool", 
                    "name": "cool2mcool.output_mcool", 
                    "step_name": "cool2mcool"
                }
            ], 
            "run": "cool2mcool.cwl"
        }
    ]
}