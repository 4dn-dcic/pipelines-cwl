{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "fdn_meta": {
        "category": "counting", 
        "data_types": [
            "DAM-ID Seq"
        ], 
        "description": "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a list of bam files and creates a list of count files", 
        "name": "dam-id-processing-pseudo-bam2counts", 
        "title": "Pseudo Workflow for DamID-seq", 
        "workflow_type": "DamID Seq data analysis"
    }, 
    "inputs": [
        {
            "fdn_format": "bam", 
            "id": "#bams", 
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
            "id": "#count_5kb", 
            "outputSource": "#count/count_5kb", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bw", 
            "fdn_output_type": "processed", 
            "id": "#count_10kb", 
            "outputSource": "#count/count_10kb", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bw", 
            "fdn_output_type": "processed", 
            "id": "#count_20kb", 
            "outputSource": "#count/count_20kb", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bw", 
            "fdn_output_type": "processed", 
            "id": "#count_40kb", 
            "outputSource": "#count/count_40kb", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bw", 
            "fdn_output_type": "processed", 
            "id": "#count_80kb", 
            "outputSource": "#count/count_80kb", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bw", 
            "fdn_output_type": "processed", 
            "id": "#count_160kb", 
            "outputSource": "#count/count_160kb", 
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
                    "counting"
                ], 
                "description": "Counting"
            }, 
            "id": "#count", 
            "in": [
                {
                    "arg_name": "bams", 
                    "fdn_cardinality": "array", 
                    "fdn_format": "bam", 
                    "fdn_type": "data file", 
                    "id": "#count/bams", 
                    "source": "#bams"
                }
            ], 
            "out": [
                {
                    "arg_name": "count_5kb", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#count/count_5kb"
                }, 
                {
                    "arg_name": "count_10kb", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#count/count_10kb"
                }, 
                {
                    "arg_name": "count_20kb", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#count/count_20kb"
                }, 
                {
                    "arg_name": "count_40kb", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#count/count_40kb"
                }, 
                {
                    "arg_name": "count_80kb", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#count/count_80kb"
                }, 
                {
                    "arg_name": "count_160kb", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#count/count_160kb"
                }
            ], 
            "run": ""
        }
    ]
}