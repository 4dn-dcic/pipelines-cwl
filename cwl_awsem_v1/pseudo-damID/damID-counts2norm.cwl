{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "fdn_meta": {
        "category": "full pipeline", 
        "data_types": [
            "DAM-ID Seq"
        ], 
        "description": "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a list of fastq files and creates bam, normalized bed, LAD bed, track bw and stats file.", 
        "name": "dam-id-processing-pseudo-counts2norm", 
        "title": "Pseudo Workflow for DamID-seq", 
        "workflow_type": "DamID Seq data analysis"
    }, 
    "inputs": [
        {
            "fdn_format": "bw", 
            "id": "#count_data", 
            "type": "File"
        }, 
        {
            "fdn_format": "bw", 
            "id": "#count_control", 
            "type": "File"
        }
    ], 
    "outputs": [
        {
            "fdn_format": "bw", 
            "fdn_output_type": "processed", 
            "id": "#norm_bw", 
            "outputSource": "#normalize/norm_bw", 
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
                    "normalization"
                ], 
                "description": "Normalization"
            }, 
            "id": "#normalize", 
            "in": [
                {
                    "arg_name": "count_data", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#normalize/count_data", 
                    "source": "#count_data"
                }, 
                {
                    "arg_name": "count_control", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#normalize/count_control", 
                    "source": "#count_control"
                }
            ], 
            "out": [
                {
                    "arg_name": "norm_bw", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#normalize/norm_bw"
                }
            ], 
            "run": ""
        }
    ]
}