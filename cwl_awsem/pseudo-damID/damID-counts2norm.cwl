{
  "class": "Workflow",
  "fdn_meta": {
    "title": "Pseudo Workflow for DamID-seq",
    "name": "dam-id-processing-pseudo-counts2norm",
    "data_types": [
      "DAM-ID Seq"
    ],
    "category": "full pipeline",
    "workflow_type": "DamID Seq data analysis",
    "description": "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a list of fastq files and creates bam, normalized bed, LAD bed, track bw and stats file."
  },
  "inputs": [
    {
      "id": "#count_data",
      "type": "File",
      "fdn_format": "bw"
    },
    {
      "id": "#count_control",
      "type": "File",
      "fdn_format": "bw"
    }
  ],
  "outputs": [
    {
      "id": "#norm_bw",
      "type": [
        "File"
      ],
      "source": "#normalize.norm_bw",
      "fdn_format": "bw",
      "fdn_output_type": "processed"
    }
  ],
  "cwlVersion": "draft-3",
  "steps": [
    {
      "fdn_step_meta": {
        "description": "Normalization",
        "analysis_step_types": [
          "normalization"
        ]
      },
      "outputs": [
        {
          "id": "#normalize.norm_bw",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        }
      ],
      "inputs": [
        {
          "id": "#normalize.count_data",
          "source": "#count_data",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        },
        {
          "id": "#normalize.count_control",
          "source": "#count_control",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        }
      ],
      "run": "",
      "id": "#normalize"
    }
  ],
  "requirements": [
    {
      "class": "InlineJavascriptRequirement"
    }
  ]
}
