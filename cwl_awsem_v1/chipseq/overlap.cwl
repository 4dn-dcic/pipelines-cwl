{
    "class": "CommandLineTool",
    "baseCommand": ["encode_naive_overlap.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*[!.][!b][!f][!i][!l][!t].\" + peak_type + \".gz"
                ]
            },
            "type": "File",
            "id": "overlap_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.\" + peak_type + \".gz"
                ]
            },
            "type": "File",
            "id": "bfilt_overlap_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.\" + peak_type + \".bb"
                ]
            },
            "type": "File",
            "id": "bfilt_overlap_peak_bb"
        }
    ],
    "inputs": [
        {
            "type": "File",
            "id": "peak1",
            "inputBinding": {
                "position": 1
            }
        },
        {
            "type": "File",
            "id": "peak2",
            "inputBinding": {
                "position": 2
            }
        },
        {
            "type": "File",
            "id": "peak_pooled",
            "inputBinding": {
                "position": 3
            }
        },
        {
            "type": "string",
            "id": "prefix",
            "inputBinding": {
                "position": 4,
                "prefix": "--prefix",
                "separate": true
            }
        },
        {
            "type": "float",
            "id": "peak_type",
            "inputBinding": {
                "position": 5,
                "prefix": "--peak-type",
                "separate": true
            }
        },
        {
            "type": "int",
            "id": "fraglen",
            "inputBinding": {
                "position": 6,
                "prefix": "--fraglen",
                "separate": true
            }
        },
        {
            "type": "File",
            "id": "chrsz",
            "inputBinding": {
                "position": 7,
                "prefix": "--chrsz",
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
        },
        {
            "type": "File",
            "id": "ta",
            "inputBinding": {
                "position": 9,
                "prefix": "--ta",
                "separate": true
            }
        }
    ],
    "id": "overlap",
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
