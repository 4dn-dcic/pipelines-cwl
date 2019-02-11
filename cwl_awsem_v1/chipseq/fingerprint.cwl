{
  "class": "CommandLineTool",
  "baseCommand": [
    "encode_fingerprint.py"
  ],
  "outputs": [
    {
      "outputBinding": {
        "glob": [
          "*.png"
        ]
      },
      "type": "File",
      "id": "plot"
    },
    {
      "outputBinding": {
        "glob": [
          "*.jsd.qc"
        ]
      },
      "type": "File[]",
      "id": "jsd_qcs"
    }
  ],
  "inputs": [
    {
      "type": {
        "type": "array",
        "items": "File"
      },
      "id": "nodup_bams",
      "inputBinding": {
        "position": 1
      }
    },
    {
      "type": "File",
      "id": "ctl_bam",
      "inputBinding": {
        "position": 2,
        "prefix": "--ctl-bam",
        "separate": true
      }
    },
    {
      "type": "File",
      "id": "blacklist",
      "inputBinding": {
        "position": 3,
        "prefix": "--blacklist",
        "separate": true
      }
    },
    {
      "type": "int",
      "id": "cpu",
      "default": 2,
      "inputBinding": {
        "position": 4,
        "separate": true,
        "prefix": "--nth"
      }
    }
  ],
  "id": "fingerprint",
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
