#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2
# and then extensively modified by Soo Lee
{
    "class": "CommandLineTool",
    "baseCommand": ["encode_pool_ta.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.tagAlign.gz"
                ]
            },
            "type": "File",
            "id": "ta_pooled"
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
                "position": 2
            }
        }
    ],
    "id": "pool_ta",
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
