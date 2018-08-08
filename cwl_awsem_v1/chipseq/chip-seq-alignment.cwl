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
      "id": "#fastqs1",
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
          "arg_name": "fastqs",
          "fdn_format": "fastq",
          "id": "#merge_fastq/fastqs",
          "source": "#fastqs1"
        },
        {
          "arg_name": "cpu",
          "id": "#merge_fastq/cpu",
          "source": "#nthreads_merge_fastq"
        }
      ],
      "out": [
        {
          "arg_name": "merged_fastq1",
          "fdn_format": "fastq",
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
          "arg_name": "fastqs",
          "fdn_format": "fastq",
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
          "arg_name": "fastq",
          "fdn_format": "fastq",
          "id": "#trim_fastq/fastq",
          "source": "#merge_fastq/merged_fastq"
        }
      ],
      "out": [
        {
          "arg_name": "trimmed_fastq",
          "fdn_format": "fastq",
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
          "arg_name": "fastq",
          "fdn_format": "fastq",
          "id": "#trim_fastq2/fastq",
          "source": "#merge_fastq2/merged_fastq"
        }
      ],
      "out": [
        {
          "arg_name": "trimmed_fastq",
          "fdn_format": "fastq",
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
          "arg_name": "fastq1",
          "fdn_format": "fastq",
          "id": "#bwa/fastq1",
          "source": "#trim_fastq/trimmed_fastq"
        },
        {
          "arg_name": "fastq2",
          "fdn_format": "fastq",
          "id": "#bwa/fastq2",
          "source": "#trim_fastq2/trimmed_fastq"
        },
        {
          "arg_name": "bwa_index",
          "fdn_format": "bwaIndex",
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
          "id": "#bwa/bam"
        },
        {
          "arg_name": "flagstat_qc",
          "fdn_format": "bam",
          "id": "#bwa/flagstat_qc"
        }
      ],
      "run": "bwa.cwl"
    }
  ]
}
