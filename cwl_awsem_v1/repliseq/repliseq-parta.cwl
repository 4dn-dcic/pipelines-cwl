{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "fdn_meta": {
        "category": "align + filter + count", 
        "data_types": [
            "Repli-seq"
        ], 
        "description": "This is a subworkflow of the Repli-seq data processing pipeline. It takes a raw fastq file, aligns to the reference genome, performs filtering and reports read counts in a bedgraph (bg) format.", 
        "name": "repliseq-parta", 
        "title": "Repli-seq data processing pipeline for alignment, filtering and counting", 
        "workflow_type": "Repli-seq data processing"
    }, 
    "inputs": [
        {
            "fdn_format": "fastq", 
            "id": "#fastq", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bwaIndex", 
            "id": "#bwaIndex", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "chromsizes", 
            "id": "#chromsizes", 
            "type": [
                "File"
            ]
        }, 
        {
            "default": 4, 
            "id": "#nthreads", 
            "type": [
                "int"
            ]
        }, 
        {
            "default": "2G", 
            "id": "#memperthread", 
            "type": [
                "string"
            ]
        }, 
        {
            "default": 5000, 
            "id": "#winsize", 
            "type": [
                "int"
            ]
        }
    ], 
    "outputs": [
        {
            "fdn_format": "bam", 
            "fdn_output_type": "processed", 
            "id": "#filtered_sorted_deduped_bam", 
            "outputSource": "#dedup/out_deduped_bam", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_output_type": "QC", 
            "id": "#dedup_qc_report", 
            "outputSource": "#dedup/out_qc_report", 
            "type": [
                "File"
            ]
        }, 
        {
            "fdn_format": "bg", 
            "fdn_output_type": "processed", 
            "fdn_secondary_file_formats": [
                "bg_px2", 
                "bw"
            ], 
            "id": "#count_bg", 
            "outputSource": "#count/out_count_bg", 
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
                    "adapter removal"
                ], 
                "description": "Adapter removal according to the Repli-seq pipeline", 
                "software_used": [
                    "cutadapt_1.14", 
                    "repli-seq-pipeline_74bb1d"
                ]
            }, 
            "id": "#clip", 
            "in": [
                {
                    "arg_name": "input_fastq", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "fastq", 
                    "fdn_type": "data file", 
                    "id": "#clip/input_fastq", 
                    "source": "#fastq"
                }
            ], 
            "out": [
                {
                    "arg_name": "out_clipped_fastq", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "fastq", 
                    "id": "#clip/out_clipped_fastq"
                }
            ], 
            "run": "clip.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "alignment"
                ], 
                "description": "Alignment according to the Repli-seq pipeline", 
                "software_used": [
                    "bwa_0.7.15", 
                    "repli-seq-pipeline_74bb1d"
                ]
            }, 
            "id": "#align", 
            "in": [
                {
                    "arg_name": "fastq1", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "fastq", 
                    "id": "#align/fastq1", 
                    "source": "#clip/out_clipped_fastq"
                }, 
                {
                    "arg_name": "bwa_index", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bwaIndex", 
                    "fdn_type": "reference file", 
                    "id": "#align/bwa_index", 
                    "source": "#bwaIndex"
                }, 
                {
                    "arg_name": "nThreads", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#align/nThreads", 
                    "source": "#nthreads"
                }
            ], 
            "out": [
                {
                    "arg_name": "out_bam", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bam", 
                    "id": "#align/out_bam"
                }
            ], 
            "run": "align.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "filtering", 
                    "sorting"
                ], 
                "description": "Filtering and sorting according to the Repli-seq pipeline", 
                "software_used": [
                    "samtools_1.4", 
                    "repli-seq-pipeline_74bb1d"
                ]
            }, 
            "id": "#filtersort", 
            "in": [
                {
                    "arg_name": "input_bam", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bam", 
                    "id": "#filtersort/input_bam", 
                    "source": "#align/out_bam"
                }, 
                {
                    "arg_name": "nthreads", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#filtersort/nthreads", 
                    "source": "#nthreads"
                }, 
                {
                    "arg_name": "memperthread", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#filtersort/memperthread", 
                    "source": "#memperthread"
                }
            ], 
            "out": [
                {
                    "arg_name": "out_filtered_sorted_bam", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bam", 
                    "id": "#filtersort/out_filtered_sorted_bam"
                }
            ], 
            "run": "filtersort.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "duplicate removal"
                ], 
                "description": "PCR Duplicate removal according to the Repli-seq pipeline", 
                "software_used": [
                    "samtools_1.4", 
                    "repli-seq-pipeline_74bb1d"
                ]
            }, 
            "id": "#dedup", 
            "in": [
                {
                    "arg_name": "input_bam", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bam", 
                    "id": "#dedup/input_bam", 
                    "source": "#filtersort/out_filtered_sorted_bam"
                }
            ], 
            "out": [
                {
                    "arg_name": "out_deduped_bam", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bam", 
                    "fdn_type": "data file", 
                    "id": "#dedup/out_deduped_bam"
                }, 
                {
                    "arg_name": "out_qc_report", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "QC", 
                    "id": "#dedup/out_qc_report"
                }
            ], 
            "run": "dedup.cwl"
        }, 
        {
            "fdn_step_meta": {
                "analysis_step_types": [
                    "binning", 
                    "aggregation"
                ], 
                "description": "Read aggregation according to the Repli-seq pipeline", 
                "software_used": [
                    "bedtools_2.26.0", 
                    "repli-seq-pipeline_74bb1d", 
                    "pairix_0.3.5", 
                    "bedGraphToBigWig_v302.1.0"
                ]
            }, 
            "id": "#count", 
            "in": [
                {
                    "arg_name": "input_bam", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bam", 
                    "fdn_type": "data file", 
                    "id": "#count/input_bam", 
                    "source": "#dedup/out_deduped_bam"
                }, 
                {
                    "arg_name": "chrsizes", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "chromsize", 
                    "fdn_type": "reference file", 
                    "id": "#count/chrsizes", 
                    "source": "#chromsizes"
                }, 
                {
                    "arg_name": "winsize", 
                    "fdn_cardinality": "single", 
                    "fdn_type": "parameter", 
                    "id": "#count/winsize", 
                    "source": "#winsize"
                }
            ], 
            "out": [
                {
                    "arg_name": "out_count_bg", 
                    "fdn_cardinality": "single", 
                    "fdn_format": "bg", 
                    "fdn_type": "data file", 
                    "id": "#count/out_count_bg"
                }
            ], 
            "run": "count.cwl"
        }
    ]
}