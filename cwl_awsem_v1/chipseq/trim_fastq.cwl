{
    "class": "CommandLineTool",
    "baseCommand": ["encode_trim_fastq.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "trimmed.fastq.gz"
                ]
            },
            "type": "File",
            "id": "trimmed_fastq"
        }
    ],
    "inputs": [
        {
            "type": "File",
            "id": "fastq",
            "inputBinding": {
              "position": 2
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
    "cwlVersion": "v1.0"
}
