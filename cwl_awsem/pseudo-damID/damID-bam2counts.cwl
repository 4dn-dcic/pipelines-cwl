{
  "class": "Workflow",
  "fdn_meta": {
    "title": "Pseudo Workflow for DamID-seq",
    "name": "dam-id-processing-pseudo-bam2counts",
    "data_types": [
      "DAM-ID Seq"
    ],
    "category": "counting",
    "workflow_type": "DamID Seq data analysis",
    "description": "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a list of bam files and creates a list of count files"
  },
  "inputs": [
    {
      "id": "#bams",
      "type": [
        {
          "type": "array",
          "items": "File"
        }
      ],
      "fdn_format": "bam"
    }
  ],
  "outputs": [
    {
      "id": "#count_5kb",
      "type": [
        "File"
      ],
      "source": "#count.count_5kb",
      "fdn_format": "bw",
      "fdn_output_type": "processed"
    },
    {
      "id": "#count_10kb",
      "type": [
        "File"
      ],
      "source": "#count.count_10kb",
      "fdn_format": "bw",
      "fdn_output_type": "processed"
    },
    {
      "id": "#count_20kb",
      "type": [
        "File"
      ],
      "source": "#count.count_20kb",
      "fdn_format": "bw",
      "fdn_output_type": "processed"
    },
    {
      "id": "#count_40kb",
      "type": [
        "File"
      ],
      "source": "#count.count_40kb",
      "fdn_format": "bw",
      "fdn_output_type": "processed"
    },
    {
      "id": "#count_80kb",
      "type": [
        "File"
      ],
      "source": "#count.count_80kb",
      "fdn_format": "bw",
      "fdn_output_type": "processed"
    },
    {
      "id": "#count_160kb",
      "type": [
        "File"
      ],
      "source": "#count.count_160kb",
      "fdn_format": "bw",
      "fdn_output_type": "processed"
    }
  ],
  "cwlVersion": "draft-3",
  "steps": [
    {
      "fdn_step_meta": {
        "description": "Counting",
        "analysis_step_types": [
          "counting"
        ]
      },
      "outputs": [
        {
          "id": "#count.count_5kb",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        },
        {
          "id": "#count.count_10kb",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        },
        {
          "id": "#count.count_20kb",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        },
        {
          "id": "#count.count_40kb",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        },
        {
          "id": "#count.count_80kb",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        },
        {
          "id": "#count.count_160kb",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        }
      ],
      "inputs": [
        {
          "id": "#count.bams",
          "source": "#bams",
          "fdn_format": "bam",
          "fdn_cardinality": "array",
          "fdn_type": "data file"
        }
      ],
      "run": "",
      "id": "#count"
    }
  ],
  "requirements": [
    {
      "class": "InlineJavascriptRequirement"
    }
  ]
}
