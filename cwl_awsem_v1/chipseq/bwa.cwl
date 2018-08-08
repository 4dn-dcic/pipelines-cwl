{
  "class": "CommandLineTool",
  "baseCommand": [
    "encode_bwa.py"
  ],
  "outputs": [
    {
      "outputBinding": {
        "glob": [
          "*.bam"
        ]
      },
      "type": "File",
      "id": "bam",
      "secondaryFiles": [
        ".bai"
      ]
    },
    {
      "outputBinding": {
        "glob": [
          "*.flagstat.qc"
        ]
      },
      "type": "File",
      "id": "flagstat_qc"
    }
  ],
  "inputs": [
    {
      "type": "File",
      "id": "bwa_index",
      "inputBinding": {
        "position": 1
      }
    },
    {
      "type": "File",
      "id": "fastq1",
      "inputBinding": {
        "position": 2
      }
    },
    {
      "type": [
        "File",
        "null"
      ],
      "id": "fastq2",
      "inputBinding": {
        "position": 3
      }
    },
    {
      "type": "boolean",
      "id": "paired_end",
      "default": false,
      "inputBinding": {
        "position": 4,
        "separate": true,
        "prefix": "--paired-end"
      }
    },
    {
      "type": "int",
      "id": "cpu",
      "default": 4,
      "inputBinding": {
        "position": 5,
        "separate": true,
        "prefix": "--nth"
      }
    }
  ],
  "id": "bwa",
  "requirements": [
    {
      "class": "ShellCommandRequirement"
    },
    {
      "class": "InlineJavascriptRequirement"
    }
  ],
  "cwlVersion": "v1.0",
  "hints": [
    {
      "dockerPull": "duplexa/4dn-chipseq:v2",
      "class": "DockerRequirement"
    }
  ]
}
