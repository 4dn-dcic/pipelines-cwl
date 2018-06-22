{
    "class": "CommandLineTool",
    "baseCommand": ["encode_merge_fastq.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "merge_fastqs_R1.fastq.gz"
                ]
            },
            "type": "File",
            "id": "merged_fastq"
        }
    ],
    "inputs": [
        {
            "type": {
                "type": "array",
                "items": "File"
            },
            "id": "fastqs",
            "inputBinding": {
                "position": 1
            }
        },
        {
            "type": "boolean",
            "id": "paired_end",
            "default": false,
            "inputBinding": {
                "position": 1,
                "separate": true,
                "prefix": "--paired-end"
            }
        },
        {
            "type": "int",
            "id": "cpu",
            "default": 2,
            "inputBinding": {
                "position": 2,
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
    "cwlVersion": "v1.0"
}
