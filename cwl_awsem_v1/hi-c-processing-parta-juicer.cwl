{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#fastq1", 
            "isArray": false, 
            "isFile": true, 
            "name": "fastq1", 
            "type": [
                "File"
            ]
        }, 
        {
            "id": "#fastq2", 
            "isArray": false, 
            "isFile": true, 
            "name": "fastq2", 
            "type": [
                "File"
            ]
        }, 
        {
            "id": "#bwa_index", 
            "isArray": false, 
            "isFile": true, 
            "name": "bwa_index", 
            "type": [
                "File"
            ]
        }, 
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
            "id": "#reference_fasta", 
            "isArray": false, 
            "isFile": true, 
            "name": "reference_fasta", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#restriction_file", 
            "isArray": false, 
            "isFile": true, 
            "name": "restriction_file", 
            "type": [
                "null", 
                "File"
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
            "default": 100, 
            "id": "#nsplit", 
            "isArray": false, 
            "isFile": false, 
            "name": "nsplit", 
            "type": [
                "null", 
                "int"
            ]
        }, 
        {
            "id": "#max_remove_mapq", 
            "isArray": false, 
            "isFile": false, 
            "name": "max_remove_mapq", 
            "type": [
                "null", 
                "int"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#out_pairs", 
            "isArray": false, 
            "isFile": true, 
            "name": "out_pairs", 
            "outputSource": "#juicer2pairs/out_pairs", 
            "source_arg": "out_pairs", 
            "source_step": "juicer2pairs", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#out_pairs_index", 
            "isArray": false, 
            "isFile": true, 
            "name": "out_pairs_index", 
            "outputSource": "#juicer2pairs/out_pairs_px", 
            "source_arg": "out_pairs_px", 
            "source_step": "juicer2pairs", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#merged_nodups", 
            "isArray": false, 
            "isFile": true, 
            "name": "merged_nodups", 
            "outputSource": "#juicer/merged_nodups", 
            "source_arg": "merged_nodups", 
            "source_step": "juicer", 
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
            "source_arg": "out_pairs", 
            "source_step": "juicer2pairs", 
            "target_arg": "out_pairs"
        }, 
        {
            "source_arg": "out_pairs_px", 
            "source_step": "juicer2pairs", 
            "target_arg": "out_pairs_index"
        }, 
        {
            "source_arg": "merged_nodups", 
            "source_step": "juicer", 
            "target_arg": "merged_nodups"
        }, 
        {
            "source_arg": "fastq1", 
            "target_arg": "input_fastq1", 
            "target_step": "juicer"
        }, 
        {
            "source_arg": "fastq2", 
            "target_arg": "input_fastq2", 
            "target_step": "juicer"
        }, 
        {
            "source_arg": "bwa_index", 
            "target_arg": "bwaIndex", 
            "target_step": "juicer"
        }, 
        {
            "source_arg": "reference_fasta", 
            "target_arg": "reference_fasta", 
            "target_step": "juicer"
        }, 
        {
            "source_arg": "chrsizes", 
            "target_arg": "chromsizes_file", 
            "target_step": "juicer"
        }, 
        {
            "source_arg": "restriction_file", 
            "target_arg": "restriction_file", 
            "target_step": "juicer"
        }, 
        {
            "target_arg": "outdir", 
            "target_step": "juicer"
        }, 
        {
            "source_arg": "ncores", 
            "target_arg": "ncores", 
            "target_step": "juicer"
        }, 
        {
            "source_arg": "merged_nodups", 
            "source_step": "juicer", 
            "target_arg": "input_merged_nodups", 
            "target_step": "juicer2pairs"
        }, 
        {
            "source_arg": "chrsizes", 
            "target_arg": "chromsize", 
            "target_step": "juicer2pairs"
        }, 
        {
            "source_arg": "nsplit", 
            "target_arg": "nsplit", 
            "target_step": "juicer2pairs"
        }, 
        {
            "target_arg": "outprefix", 
            "target_step": "juicer2pairs"
        }, 
        {
            "source_arg": "max_remove_mapq", 
            "target_arg": "max_remove_mapq", 
            "target_step": "juicer2pairs"
        }
    ], 
    "steps": [
        {
            "id": "#juicer", 
            "in": [
                {
                    "arg_name": "input_fastq1", 
                    "id": "#juicer/input_fastq1", 
                    "name": "juicer.input_fastq1", 
                    "source": "#fastq1", 
                    "source_arg": "fastq1", 
                    "step_name": "juicer"
                }, 
                {
                    "arg_name": "input_fastq2", 
                    "id": "#juicer/input_fastq2", 
                    "name": "juicer.input_fastq2", 
                    "source": "#fastq2", 
                    "source_arg": "fastq2", 
                    "step_name": "juicer"
                }, 
                {
                    "arg_name": "bwaIndex", 
                    "id": "#juicer/bwaIndex", 
                    "name": "juicer.bwaIndex", 
                    "source": "#bwa_index", 
                    "source_arg": "bwa_index", 
                    "step_name": "juicer"
                }, 
                {
                    "arg_name": "reference_fasta", 
                    "id": "#juicer/reference_fasta", 
                    "name": "juicer.reference_fasta", 
                    "source": "#reference_fasta", 
                    "source_arg": "reference_fasta", 
                    "step_name": "juicer"
                }, 
                {
                    "arg_name": "chromsizes_file", 
                    "id": "#juicer/chromsizes_file", 
                    "name": "juicer.chromsizes_file", 
                    "source": "#chrsizes", 
                    "source_arg": "chrsizes", 
                    "step_name": "juicer"
                }, 
                {
                    "arg_name": "restriction_file", 
                    "id": "#juicer/restriction_file", 
                    "name": "juicer.restriction_file", 
                    "source": "#restriction_file", 
                    "source_arg": "restriction_file", 
                    "step_name": "juicer"
                }, 
                {
                    "arg_name": "outdir", 
                    "id": "#juicer/outdir", 
                    "name": "juicer.outdir", 
                    "step_name": "juicer"
                }, 
                {
                    "arg_name": "ncores", 
                    "id": "#juicer/ncores", 
                    "name": "juicer.ncores", 
                    "source": "#ncores", 
                    "source_arg": "ncores", 
                    "step_name": "juicer"
                }
            ], 
            "name": "juicer", 
            "out": [
                {
                    "arg_name": "merged_nodups", 
                    "id": "#juicer/merged_nodups", 
                    "name": "juicer.merged_nodups", 
                    "step_name": "juicer"
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
                    "name": "juicer2pairs.input_merged_nodups", 
                    "source": "#juicer/merged_nodups", 
                    "source_arg": "merged_nodups", 
                    "source_step": "juicer", 
                    "step_name": "juicer2pairs"
                }, 
                {
                    "arg_name": "chromsize", 
                    "id": "#juicer2pairs/chromsize", 
                    "name": "juicer2pairs.chromsize", 
                    "source": "#chrsizes", 
                    "source_arg": "chrsizes", 
                    "step_name": "juicer2pairs"
                }, 
                {
                    "arg_name": "nsplit", 
                    "id": "#juicer2pairs/nsplit", 
                    "name": "juicer2pairs.nsplit", 
                    "source": "#nsplit", 
                    "source_arg": "nsplit", 
                    "step_name": "juicer2pairs"
                }, 
                {
                    "arg_name": "outprefix", 
                    "id": "#juicer2pairs/outprefix", 
                    "name": "juicer2pairs.outprefix", 
                    "step_name": "juicer2pairs"
                }, 
                {
                    "arg_name": "max_remove_mapq", 
                    "id": "#juicer2pairs/max_remove_mapq", 
                    "name": "juicer2pairs.max_remove_mapq", 
                    "source": "#max_remove_mapq", 
                    "source_arg": "max_remove_mapq", 
                    "step_name": "juicer2pairs"
                }
            ], 
            "name": "juicer2pairs", 
            "out": [
                {
                    "arg_name": "out_pairs", 
                    "id": "#juicer2pairs/out_pairs", 
                    "name": "juicer2pairs.out_pairs", 
                    "step_name": "juicer2pairs"
                }, 
                {
                    "arg_name": "out_pairs_px", 
                    "id": "#juicer2pairs/out_pairs_px", 
                    "name": "juicer2pairs.out_pairs_px", 
                    "step_name": "juicer2pairs"
                }
            ], 
            "run": "juicer2pairs.cwl"
        }
    ]
}