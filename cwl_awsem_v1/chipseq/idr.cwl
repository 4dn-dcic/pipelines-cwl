{
    "class": "CommandLineTool",
    "baseCommand": ["encode_idr.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*[!.][!b][!f][!i][!l][!t].\" + peak_type + \".gz"
                ]
            },
            "type": "File",
            "id": "idr_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.\" + peak_type + \".gz"
                ]
            },
            "type": "File",
            "id": "bfilt_idr_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.\" + peak_type + \".bb"
                ]
            },
            "type": "File",
            "id": "bfilt_idr_peak_bb"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.txt.png"
                ]
            },
            "type": "File",
            "id": "idr_plot"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.txt.gz"
                ]
            },
            "type": "File",
            "id": "idr_unthresholded_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.log"
                ]
            },
            "type": "File",
            "id": "idr_log"
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
            "id": "idr_thresh",
            "default": 0.05,
            "inputBinding": {
                "position": 5,
                "prefix": "--idr-thresh",
                "separate": true
            }
        },
        {
            "type": "float",
            "id": "peak_type",
            "inputBinding": {
                "position": 6,
                "prefix": "--peak-type",
                "separate": true
            }
        },
        {
            "type": "int",
            "id": "fraglen",
            "inputBinding": {
                "position": 7,
                "prefix": "--fraglen",
                "separate": true
            }
        },
        {
            "type": "File",
            "id": "chrsz",
            "inputBinding": {
                "position": 8,
                "prefix": "--chrsz",
                "separate": true
            }
        },
        {
            "type": "File",
            "id": "blacklist",
            "inputBinding": {
                "position": 9,
                "prefix": "--blacklist",
                "separate": true
            }
        },
        {
            "type": "File?",
            "id": "ta",
            "inputBinding": {
                "position": 10,
                "prefix": "--ta",
                "separate": true
            }
        },
        {
            "type": "string",
            "id": "rank",
            "inputBinding": {
                "position": 11,
                "prefix": "--idr-rank",
                "separate": true
            }
        }
    ],
    "id": "idr",
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
