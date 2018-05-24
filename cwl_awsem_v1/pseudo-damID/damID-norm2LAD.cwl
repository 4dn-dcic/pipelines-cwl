{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "fdn_meta": {
        "category": "LAD calling", 
        "data_types": [
            "DAM-ID Seq"
        ], 
        "description": "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a normalized bw file and creates a LAD bed file and a LAD state txt file.", 
        "name": "dam-id-processing-pseudo-norm2LAD", 
        "title": "Pseudo Workflow for DamID-seq", 
        "workflow_type": "DamID Seq data analysis"
    }, 
    "inputs": [
        {
            "fdn_format": "bw", 
            "id": "#norm_bw", 
            "type": "File"
        }
    ], 
    "outputs": [
        {
            "fdn_format": "bed", 
            "fdn_output_type": "processed", 
            "id": "#LAD", 
            "outputSource": "#call-lad/lad", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "txt", 
            "fdn_output_type": "processed", 
            "id": "#LAD_states", 
            "outputSource": "#call-lad/lad_states", 
            "type": [
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
            "fdn_step_meta": {
                "analysis_step_types": [
                    "lad-calling"
                ], 
                "description": "Calling LADs"
            }, 
            "id": "#call-lad", 
            "in": [
                {
                    "arg_name": "norm_bw", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#call-lad/norm_bw", 
                    "source": "#norm_bw"
                }
            ], 
            "out": [
                {
                    "arg_name": "lad", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#call-lad/lad"
                }, 
                {
                    "arg_name": "lad_states", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#call-lad/lad_states"
                }
            ], 
            "run": ""
        }
    ]
}