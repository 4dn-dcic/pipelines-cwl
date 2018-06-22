{
    "class": "CommandLineTool",
    "baseCommand": ["encode_reproducibility_qc.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*reproducibility.qc"
                ]
            },
            "type": "File",
            "id": "reproducibility_qc"
        }
    ],
    "inputs": [
        {
           "type": {
                "type": "array",
                "items": "File"
            },
            "id": "peaks",
            "inputBinding": {
                "position": 1
            }
        },
        {
           "type": {
                "type": "array",
                "items": "File"
            },
            "id": "peaks_pr",
            "inputBinding": {
                "position": 2
            }
        },
        {
            "type": "File",
            "id": "peak_ppr",
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
        }
    ],
    "id": "reproducibility",
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
