{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "fdn_meta": {
        "category": "Merging", 
        "data_types": [
            "DAM-ID Seq"
        ], 
        "description": "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a list of fastq files and creates bam, normalized bed, LAD bed, track bw and stats file.", 
        "name": "dam-id-processing-pseudo-combine-norm", 
        "title": "Pseudo Workflow for DamID-seq", 
        "workflow_type": "DamID Seq data analysis"
    }, 
    "inputs": [
        {
            "fdn_format": "bw", 
            "id": "#norm_bws", 
            "type": [
                {
                    "items": "File", 
                    "type": "array"
                }
            ]
        }
    ], 
    "outputs": [
        {
            "fdn_format": "bw", 
            "fdn_output_type": "processed", 
            "id": "#combined_norm_bw", 
            "outputSource": "#combine/combined_norm_bw", 
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
                    "merging"
                ], 
                "description": "Combine norm.bw"
            }, 
            "id": "#combine", 
            "in": [
                {
                    "arg_name": "norm_bws", 
                    "fdn_cardinality": "array", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#combine/norm_bws", 
                    "source": "#norm_bws"
                }
            ], 
            "out": [
                {
                    "arg_name": "combined_norm_bw", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#combine/combined_norm_bw"
                }
            ], 
            "run": ""
        }
    ]
}