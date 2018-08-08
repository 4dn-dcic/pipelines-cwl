{
  "class": "CommandLineTool",
  "baseCommand": [
    "encode_choose_ctl.py"
  ],
  "outputs": [
    {
      "outputBinding": {
        "glob": [
          "ctl_for_rep*.tagAlign.gz"
        ]
      },
      "type": "File[]",
      "id": "chosen_ctl_tas"
    }
  ],
  "inputs": [
    {
      "type": {
        "type": "array",
        "items": "File"
      },
      "id": "tas",
      "inputBinding": {
        "position": 1
      }
    },
    {
      "type": {
        "type": "array",
        "items": "File"
      },
      "id": "ctl_tas",
      "inputBinding": {
        "position": 2,
        "prefix": "--ctl-bam",
        "separate": true
      }
    },
    {
      "type": "File",
      "id": "ta_pooled",
      "inputBinding": {
        "position": 3,
        "prefix": "--ta-pooled",
        "separate": true
      }
    },
    {
      "type": "File",
      "id": "ctl_ta_pooled",
      "inputBinding": {
        "position": 4,
        "prefix": "--ctl-ta-pooled",
        "separate": true
      }
    },
    {
      "type": "boolean",
      "id": "always_use_pooled_ctl",
      "default": false,
      "inputBinding": {
        "position": 5,
        "prefix": "--always-use-pooled-ctl",
        "separate": true
      }
    },
    {
      "type": "float",
      "id": "ctl_depth_ratio",
      "default": 1.2,
      "inputBinding": {
        "position": 6,
        "prefix": "--ctl-depth-ratio",
        "separate": true
      }
    }
  ],
  "id": "choose_ctl",
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
