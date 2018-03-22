{
  "class": "Workflow",
  "fdn_meta": {
    "title": "Pseudo Workflow for DamID-seq",
    "name": "dam-id-processing-pseudo-norm2LAD",
    "data_types": [
      "DAM-ID Seq"
    ],
    "category": "LAD calling",
    "workflow_type": "DamID Seq data analysis",
    "description": "This is a pseudo-workflow of DamID-seq data processing pipeline. It takes a normalized bw file and creates a LAD bed file and a LAD state txt file."
  },
  "inputs": [
    {
      "id": "#norm_bw",
      "type": "File",
      "fdn_format": "bw"
    }
  ],
  "outputs": [
    {
      "id": "#LAD",
      "type": [
        "File"
      ],
      "source": "#call-lad.lad",
      "fdn_format": "bed",
      "fdn_output_type": "processed"
    },
    {
      "id": "#LAD_states",
      "type": [
        "File"
      ],
      "source": "#call-lad.lad_states",
      "fdn_format": "txt",
      "fdn_output_type": "processed"
    }
  ],
  "cwlVersion": "draft-3",
  "steps": [
    {
      "fdn_step_meta": {
        "description": "Calling LADs",
        "analysis_step_types": [
          "lad-calling"
        ]
      },
      "outputs": [
        {
          "id": "#call-lad.lad",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        },
        {
          "id": "#call-lad.lad_states",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        }
      ],
      "inputs": [
        {
          "id": "#call-lad.norm_bw",
          "source": "#norm_bw",
          "fdn_format": "bw",
          "fdn_cardinality": "single",
          "fdn_type": "data file"
        }
      ],
      "run": "",
      "id": "#call-lad"
    }
  ],
  "requirements": [
    {
      "class": "InlineJavascriptRequirement"
    }
  ]
}
