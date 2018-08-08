{
  "class": "Workflow",
  "cwlVersion": "v1.0",
  "fdn_meta": {
    "category": "alignment",
    "data_types": [
      "ChIP-seq"
    ],
    "description": "This is a subworkflow of the ChIP-seq data processing pipeline. It takes a set of fastq files as input and performs merging, trimming and alignment. It produces a lossless, filter-annotated bam file and a qc summary text.",
    "name": "chip-seq-alignment",
    "title": "Alignment for ChIP-seq using bwa-mem",
    "workflow_type": "ChIP-seq data analysis"
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
    },
    {
      "fdn_format": "fastq",
      "id": "#fastqs2",
      "type": [
        {
          "items": "File",
          "type": "array"
        }
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
      "default": 8,
      "id": "#nthreads_merge_fastq",
      "type": [
        "int"
      ]
    },
    {
      "default": 8,
      "id": "#nthreads_bwa",
      "type": [
        "int"
      ]
    },
    {
      "default": false,
      "id": "#paired_end",
      "type": [
        "boolean"
      ]
    }
  ],
  "outputs": [
    {
      "fdn_format": "bam",
      "fdn_output_type": "processed",
      "id": "#bam",
      "outputSource": "#bwa/bam",
      "type": [
        "File"
      ],
      "fdn_secondary_file_formats": [
        "bai"
      ]
    },
    {
      "fdn_output_type": "QC",
      "id": "#alignment_qc",
      "outputSource": "#bwa/flagstat_qc",
      "type": [
        "File"
      ]
    }
  ],
  "requirements": [
    {
      "class": "InlineJavascriptRequirement"
    },
    {
      "class": "ScatterFeatureRequirement"
    }
  ],
  "steps": [
    {
      "fdn_step_meta": {
        "analysis_step_types": [
          "merging"
        ],
        "description": "Merging raw fastq files"
      },
      "id": "#merge_fastq",
      "in": [
        {
          "arg_name": "fastqs_to_be_merged",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "array",
          "id": "#merge_fastq/fastqs",
          "source": "#fastqs"
        },
        {
          "arg_name": "cpu",
          "id": "#merge_fastq/cpu",
          "source": "#nthreads_merge_fastq"
        }
      ],
      "out": [
        {
          "arg_name": "merged_fastq",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "single",
          "id": "#merge_fastq/merged_fastq"
        }
      ],
      "run": "merge_fastq.cwl"
    },
    {
      "fdn_step_meta": {
        "analysis_step_types": [
          "merging"
        ],
        "description": "Merging raw fastq files"
      },
      "id": "#merge_fastq2",
      "in": [
        {
          "arg_name": "fastqs_to_be_merged2",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "array",
          "id": "#merge_fastq2/fastqs",
          "source": "#fastqs2"
        },
        {
          "arg_name": "cpu",
          "id": "#merge_fastq2/cpu",
          "source": "#nthreads_merge_fastq"
        }
      ],
      "out": [
        {
          "arg_name": "merged_fastq2",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "single",
          "id": "#merge_fastq2/merged_fastq"
        }
      ],
      "run": "merge_fastq.cwl"
    },
    {
      "fdn_step_meta": {
        "analysis_step_types": [
          "trimming"
        ],
        "description": "Trimming fastq files"
      },
      "id": "#trim_fastq",
      "in": [
        {
          "arg_name": "fastq_to_be_trimmed",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "single",
          "id": "#trim_fastq/fastq",
          "source": "#merge_fastq/merged_fastq"
        }
      ],
      "out": [
        {
          "arg_name": "trimmed_fastq",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "single",
          "id": "#trim_fastq/trimmed_fastq"
        }
      ],
      "run": "trim_fastq.cwl"
    },
    {
      "fdn_step_meta": {
        "analysis_step_types": [
          "trimming"
        ],
        "description": "Trimming fastq files"
      },
      "id": "#trim_fastq2",
      "in": [
        {
          "arg_name": "fastqs_to_be_trimmed2",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "single",
          "id": "#trim_fastq2/fastq",
          "source": "#merge_fastq2/merged_fastq"
        }
      ],
      "out": [
        {
          "arg_name": "trimmed_fastq2",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "single",
          "id": "#trim_fastq2/trimmed_fastq"
        }
      ],
      "run": "trim_fastq.cwl"
    },
    {
      "fdn_step_meta": {
        "analysis_step_types": [
          "alignment"
        ],
        "description": "Aligning reads to genome",
        "software_used": [
          "bwa_0.7.17"
        ]
      },
      "id": "#bwa",
      "in": [
        {
          "arg_name": "fastq_to_be_aligned",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "single",
          "id": "#bwa/fastq1",
          "source": "#trim_fastq/trimmed_fastq"
        },
        {
          "arg_name": "fastq_to_be_aligned2",
          "fdn_format": "fastq",
          "fdn_type": "data file",
          "fdn_cardinality": "single",
          "id": "#bwa/fastq2",
          "source": "#trim_fastq2/trimmed_fastq"
        },
        {
          "arg_name": "bwa_index",
          "fdn_format": "bwaIndex",
          "fdn_type": "reference file",
          "fdn_cardinality": "single",
          "id": "#bwa/bwa_index",
          "source": "#bwaIndex"
        },
        {
          "arg_name": "paired_end",
          "id": "#bwa/paired_end",
          "source": "#paired_end"
        },
        {
          "arg_name": "cpu",
          "id": "#bwa/cpu",
          "source": "#nthreads_bwa"
        }
      ],
      "out": [
        {
          "arg_name": "bam",
          "fdn_format": "bam",
          "fdn_type": "data file",
          "fdn_cardinality": "single",
          "id": "#bwa/bam"
        },
        {
          "arg_name": "flagstat_qc",
          "fdn_type": "QC file",
          "id": "#bwa/flagstat_qc"
        }
      ],
      "run": "bwa.cwl"
    }
  ]
}
