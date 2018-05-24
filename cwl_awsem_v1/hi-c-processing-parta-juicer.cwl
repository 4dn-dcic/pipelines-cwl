{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#fastq1", 
            "type": [
                "File"
            ]
        }, 
        {
            "id": "#fastq2", 
            "type": [
                "File"
            ]
        }, 
        {
            "id": "#bwa_index", 
            "type": [
                "File"
            ]
        }, 
        {
            "id": "#chrsizes", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#reference_fasta", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#restriction_file", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "default": 8, 
            "id": "#ncores", 
            "type": [
                "null", 
                "int"
            ]
        }, 
        {
            "default": 100, 
            "id": "#nsplit", 
            "type": [
                "null", 
                "int"
            ]
        }, 
        {
            "id": "#max_remove_mapq", 
            "type": [
                "null", 
                "int"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#out_pairs", 
            "outputSource": "#juicer2pairs/out_pairs", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#out_pairs_index", 
            "outputSource": "#juicer2pairs/out_pairs_px", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#merged_nodups", 
            "outputSource": "#juicer/merged_nodups", 
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
            "id": "#juicer", 
            "in": [
                {
                    "arg_name": "input_fastq1", 
                    "id": "#juicer/input_fastq1", 
                    "source": "#fastq1"
                }, 
                {
                    "arg_name": "input_fastq2", 
                    "id": "#juicer/input_fastq2", 
                    "source": "#fastq2"
                }, 
                {
                    "arg_name": "bwaIndex", 
                    "id": "#juicer/bwaIndex", 
                    "source": "#bwa_index"
                }, 
                {
                    "arg_name": "reference_fasta", 
                    "id": "#juicer/reference_fasta", 
                    "source": "#reference_fasta"
                }, 
                {
                    "arg_name": "chromsizes_file", 
                    "id": "#juicer/chromsizes_file", 
                    "source": "#chrsizes"
                }, 
                {
                    "arg_name": "restriction_file", 
                    "id": "#juicer/restriction_file", 
                    "source": "#restriction_file"
                }, 
                {
                    "arg_name": "outdir", 
                    "id": "#juicer/outdir"
                }, 
                {
                    "arg_name": "ncores", 
                    "id": "#juicer/ncores", 
                    "source": "#ncores"
                }
            ], 
            "out": [
                {
                    "arg_name": "merged_nodups", 
                    "id": "#juicer/merged_nodups"
                }
            ], 
            "run": "juicer.cwl"
        }, 
        {
            "id": "#juicer2pairs", 
            "in": [
                {
                    "arg_name": "input_merged_nodups", 
                    "id": "#juicer2pairs/input_merged_nodups", 
                    "source": "#juicer/merged_nodups"
                }, 
                {
                    "arg_name": "chromsize", 
                    "id": "#juicer2pairs/chromsize", 
                    "source": "#chrsizes"
                }, 
                {
                    "arg_name": "nsplit", 
                    "id": "#juicer2pairs/nsplit", 
                    "source": "#nsplit"
                }, 
                {
                    "arg_name": "outprefix", 
                    "id": "#juicer2pairs/outprefix"
                }, 
                {
                    "arg_name": "max_remove_mapq", 
                    "id": "#juicer2pairs/max_remove_mapq", 
                    "source": "#max_remove_mapq"
                }
            ], 
            "out": [
                {
                    "arg_name": "out_pairs", 
                    "id": "#juicer2pairs/out_pairs"
                }, 
                {
                    "arg_name": "out_pairs_px", 
                    "id": "#juicer2pairs/out_pairs_px"
                }
            ], 
            "run": "juicer2pairs.cwl"
        }
    ]
}