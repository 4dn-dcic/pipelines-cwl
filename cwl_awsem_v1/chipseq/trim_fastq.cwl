#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.fastq.gz"
                ]
            },
            "type": "File",
            "id": "trimmed_fastq"
        }
    ],
    "inputs": [
        {
            "type": "File",
            "id": "fastq"
        },
        {
            "type": "int?",
            "id": "trim_bp"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "python $(which encode_trim_fastq.py) $(inputs.fastq.path) --trim-bp $(inputs.trip_bp)"
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