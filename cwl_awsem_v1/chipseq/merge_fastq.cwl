{
  "class": "CommandLineTool",
  "baseCommand": [
    "encode_merge_fastq.py"
  ],
  "outputs": [
    {
      "outputBinding": {
        "glob": "merge_fastqs_R1*merged.fastq.gz"
      },
      "type": [
        "File",
        "null"
      ],
      "id": "merged_fastq"
    }
  ],
  "inputs": [
    {
      "type": [
        {
          "type": "array",
          "items": "File"
        },
        "null"
      ],
      "id": "fastqs",
      "inputBinding": {
        "position": 2,
        "separate": true,
        "prefix": "--fastq"
      }
    },
    {
      "type": "int",
      "id": "cpu",
      "default": 2,
      "inputBinding": {
        "position": 1,
        "separate": true,
        "prefix": "--nth"
      }
    }
  ],
  "id": "merge_fastq",
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
