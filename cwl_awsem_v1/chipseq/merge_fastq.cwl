#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "merge_fastqs_R?_*.fastq.gz"
                ]
            },
            "type": "File[]",
            "id": "merged_fastqs"
        }
    ],
    "inputs": [
        {
            "type": {
                "type": "array",
                "items": {
                    "type": "array",
                    "items": "File"
                }
            },
            "id": "fastqs"
        },
        {
            "type": "boolean",
            "id": "paired_end"
        },
        {
            "type": "int?",
            "id": "cpu"
        },
        {
            "type": "int?",
            "id": "mem_mb"
        },
        {
            "type": "int?",
            "id": "time_hr"
        },
        {
            "type": "string?",
            "id": "disks"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "python $(which encode_merge_fastq.py) $(\"--nth \" + inputs.cpu)"
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