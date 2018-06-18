#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.bam"
                ]
            },
            "type": "File",
            "id": "nodup_bam"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bai"
                ]
            },
            "type": "File",
            "id": "nodup_bai"
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
            "id": "bam"
        },
        {
            "type": "boolean",
            "id": "paired_end"
        },
        {
            "type": "int?",
            "id": "multimapping"
        },
        {
            "type": "string?",
            "id": "dup_marker"
        },
        {
            "type": "int?",
            "id": "mapq_thresh"
        },
        {
            "type": "boolean?",
            "id": "no_dup_removal"
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
            "valueFrom": "python $(which encode_filter.py) $(inputs.bam.path) $(\"--multimapping \" + inputs.multimapping) $(\"--dup-marker \" + inputs.dup_marker) $(\"--mapq-thresh \" + inputs.mapq_thresh) $(\"--nth \" + inputs.cpu)\t\t# ugly part to deal with optional outputs with Google JES backend\t\ttouch null"
        }
    ],
    "id": "filter",
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