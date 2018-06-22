{
    "class": "CommandLineTool",
    "baseCommand": ["encode_bwa.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.bam"
                ]
            },
            "type": "File",
            "id": "bam"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bai"
                ]
            },
            "type": "File",
            "id": "bai"
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
            "id": "idx_tar",
            "inputBinding": {
              "position": 1
            }
        },
        {
           "type": {
                "type": "array",
                "items": "File"
            },
            "id": "fastqs",
            "inputBinding": {
                "position": 2
            }
        },
        {
            "type": "boolean",
            "id": "paired_end",
            "default": false,
            "inputBinding": {
                "position": 3,
                "separate": true,
                "prefix": "--paired-end"
            }
        },
        {
            "type": "int",
            "id": "cpu",
            "default": 4,
            "inputBinding": {
                "position": 4,
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
    "cwlVersion": "v1.0"
}
