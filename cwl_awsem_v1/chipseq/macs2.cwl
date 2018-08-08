{
  "class": "CommandLineTool",
  "baseCommand": [
    "encode_macs2_chip.py"
  ],
  "outputs": [
    {
      "outputBinding": {
        "glob": [
          "*[!.][!b][!f][!i][!l][!t].narrowPeak.gz"
        ]
      },
      "type": "File",
      "id": "npeak"
    },
    {
      "outputBinding": {
        "glob": [
          "*.bfilt.narrowPeak.gz"
        ]
      },
      "type": "File",
      "id": "bfilt_npeak"
    },
    {
      "outputBinding": {
        "glob": [
          "*.bfilt.narrowPeak.bb"
        ]
      },
      "type": "File",
      "id": "bfilt_npeak_bb"
    },
    {
      "outputBinding": {
        "glob": [
          "*.frip.qc"
        ]
      },
      "type": "File",
      "id": "frip_qc"
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
      "type": "int",
      "id": "fraglen",
      "inputBinding": {
        "position": 2,
        "prefix": "--fraglen",
        "separate": true
      }
    },
    {
      "type": "string",
      "id": "gensz",
      "inputBinding": {
        "position": 3,
        "prefix": "--gensz",
        "separate": true
      }
    },
    {
      "type": "File",
      "id": "chrsz",
      "inputBinding": {
        "position": 4,
        "prefix": "--chrsz",
        "separate": true
      }
    },
    {
      "type": "int",
      "id": "cap_num_peak",
      "default": 500000,
      "inputBinding": {
        "position": 5,
        "prefix": "--cap-num-peak ",
        "separate": true
      }
    },
    {
      "type": "float",
      "id": "pval_thresh",
      "default": 0.01,
      "inputBinding": {
        "position": 6,
        "prefix": "--pval-thresh",
        "separate": true
      }
    },
    {
      "type": "boolean",
      "id": "make_signal",
      "default": false,
      "inputBinding": {
        "position": 7,
        "prefix": "--make-signal",
        "separate": true
      }
    },
    {
      "type": "File",
      "id": "blacklist",
      "inputBinding": {
        "position": 8,
        "prefix": "--blacklist",
        "separate": true
      }
    }
  ],
  "id": "macs2",
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
