#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.tagAlign.gz"
                ]
            },
            "type": "File",
            "id": "ta"
        }
    ],
    "inputs": [
        {
            "type": "File",
            "id": "bam"
        },
        {
            "type": "boolean",
            "id": "paired_end"
        },
        {
            "type": "boolean",
            "id": "disable_tn5_shift"
        },
        {
            "type": "string?",
            "id": "regex_grep_v_ta"
        },
        {
            "type": "int?",
            "id": "subsample"
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
            "valueFrom": "python $(which encode_bam2ta.py) $(inputs.bam.path) $(\"--regex-grep-v-ta \" + \"'\" + inputs.regex_grep_v_ta + \"'\") $(\"--subsample \" + inputs.subsample) $(\"--nth \" + inputs.cpu)"
        }
    ],
    "id": "bam2ta",
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