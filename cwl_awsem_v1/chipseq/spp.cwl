{
    "class": "CommandLineTool",
    "baseCommand": ["encode_spp.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*[!.][!b][!f][!i][!l][!t].regionPeak.gz"
                ]
            },
            "type": "File",
            "id": "rpeak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.regionPeak.gz"
                ]
            },
            "type": "File",
            "id": "bfilt_rpeak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.regionPeak.bb"
                ]
            },
            "type": "File",
            "id": "bfilt_rpeak_peak_bb"
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
            "type": "File",
            "id": "chrsz",
            "inputBinding": {
                "position": 3,
                "prefix": "--chrsz",
                "separate": true
            }
        },
        {
            "type": "int",
            "id": "cap_num_peak",
            "default": 300000,
            "inputBinding": {
                "position": 4,
                "prefix": "--cap-num-peak ",
                "separate": true
            }
        },
        {
            "type": "File",
            "id": "blacklist",
            "inputBinding": {
                "position": 5,
                "prefix": "--blacklist",
                "separate": true
            }
        },
        {
            "type": "int",
            "id": "cpu",
            "default": 2,
            "inputBinding": {
                "position": 6,
                "prefix": "--nth",
                "separate": true
            }
        }
    ],
    "id": "spp",
    "requirements": [
        {
            "class": "ShellCommandRequirement"
        },
        {
            "class": "InlineJavascriptRequirement"
        }
    ],
    "cwlVersion": "v1.0"
}
