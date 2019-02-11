{
  "class": "CommandLineTool",
  "baseCommand": [
    "encode_trim_fastq.py"
  ],
  "outputs": [
    {
      "outputBinding": {
        "glob": "*trim*fastq.gz"
      },
      "type": [
        "File",
        "null"
      ],
      "id": "trimmed_fastq"
    }
  ],
  "inputs": [
    {
      "type": [
        "File",
        "null"
      ],
      "id": "fastq",
      "inputBinding": {
        "position": 3,
        "prefix": "--fastq",
        "separate": true
      }
    },
    {
      "type": "int",
      "id": "trim_bp",
      "default": 50,
      "inputBinding": {
        "position": 1,
        "prefix": "--trim-bp",
        "separate": true
      }
    },
    {
      "type": "string",
      "id": "outdir",
      "default": ".",
      "inputBinding": {
        "position": 2,
        "prefix": "--out-dir",
        "separate": true
      }
    }
  ],
  "id": "trim_fastq",
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
