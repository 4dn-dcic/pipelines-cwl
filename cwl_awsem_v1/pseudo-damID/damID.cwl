{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "fdn_meta": {
        "category": "full pipeline", 
        "data_types": [
            "DAM-ID Seq"
        ], 
        "description": "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a list of fastq files and creates bam, normalized bed, LAD bed, track bw and stats file.", 
        "name": "dam-id-processing-pseudo", 
        "title": "Pseudo Workflow for DamID-seq", 
        "workflow_type": "DamID Seq data analysis"
    }, 
    "inputs": [
        {
            "fdn_format": "fastq", 
            "id": "#fastqs", 
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
            "fdn_format": "bam", 
            "fdn_output_type": "processed", 
            "id": "#bam", 
            "outputSource": "#trim-align/bam", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bed", 
            "fdn_output_type": "processed", 
            "id": "#normalized_bed", 
            "outputSource": "#normalize/normalized_bed", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bed", 
            "fdn_output_type": "processed", 
            "id": "#LAD_bed", 
            "outputSource": "#call-lad/lad_bed", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bw", 
            "fdn_output_type": "processed", 
            "id": "#track_bw", 
            "outputSource": "#call-lad/track_bw", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "txt", 
            "fdn_output_type": "processed", 
            "id": "#stats", 
            "outputSource": "#call-lad/stats", 
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
                    "alignment"
                ], 
                "description": "Trimming and Aligning a set of fastq files"
            }, 
            "id": "#trim-align", 
            "in": [
                {
                    "arg_name": "fastqs", 
                    "fdn_cardinality": "array", 
                    "fdn_format": "fastq", 
                    "fdn_type": "data file", 
                    "id": "#trim-align/fastqs", 
                    "source": "#fastqs"
                }
            ], 
            "out": [
                {
                    "arg_name": "bam", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bam", 
                    "fdn_type": "data file", 
                    "id": "#trim-align/bam"
                }
            ], 
            "run": ""
        }, 
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
                    "arg_name": "bam", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bam", 
                    "fdn_type": "data file", 
                    "id": "#normalize/bam", 
                    "source": "#trim-align/bam"
                }
            ], 
            "out": [
                {
                    "arg_name": "normalized_bed", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bed", 
                    "fdn_type": "data file", 
                    "id": "#normalize/normalized_bed"
                }
            ], 
            "run": ""
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "LAD calling"
                ], 
                "description": "Calling LADs"
            }, 
            "id": "#call-lad", 
            "in": [
                {
                    "arg_name": "normalized_bed", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bed", 
                    "fdn_type": "data file", 
                    "id": "#call-lad/normalized_bed", 
                    "source": "#normalize/normalized_bed"
                }
            ], 
            "out": [
                {
                    "arg_name": "lad_bed", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bed", 
                    "fdn_type": "data file", 
                    "id": "#call-lad/lad_bed"
                }, 
                {
                    "arg_name": "track_bw", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bw", 
                    "fdn_type": "data file", 
                    "id": "#call-lad/track_bw"
                }, 
                {
                    "arg_name": "stats", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "txt", 
                    "fdn_type": "data file", 
                    "id": "#call-lad/stats"
                }
            ], 
            "run": ""
        }
    ]
}