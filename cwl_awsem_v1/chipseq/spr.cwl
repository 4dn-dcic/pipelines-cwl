#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2
# and then extensively modified by Soo Lee
{
    "class": "CommandLineTool",
    "baseCommand": ["encode_spr.py"],
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
            "id": "ta",
            "inputBinding": {
                "position": 1
            }
        },
        {
            "type": "boolean",
            "id": "paired_end",
            "default": false,
            "inputBinding": {
                "position": 2,
                "separate": true,
                "prefix": "--paired-end"
            }
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
