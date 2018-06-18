#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.pr1.tagAlign.gz"
                ]
            },
            "type": "File",
            "id": "ta_pr1"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.pr2.tagAlign.gz"
                ]
            },
            "type": "File",
            "id": "ta_pr2"
        }
    ],
    "inputs": [
        {
            "type": "File",
            "id": "ta"
        },
        {
            "type": "boolean",
            "id": "paired_end"
        },
        {
            "type": "int?",
            "id": "mem_mb"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "python $(which encode_spr.py) $(inputs.ta.path)"
        }
    ],
    "id": "spr",
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