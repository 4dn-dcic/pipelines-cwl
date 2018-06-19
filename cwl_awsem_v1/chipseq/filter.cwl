#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2
# and then extensively modified by Soo Lee
{
    "class": "CommandLineTool",
    "baseCommand": ["encode_filter.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.bam"
                ]
            },
            "type": "File",
            "id": "nodup_bam",
            "secondaryFiles": [
              ".bai"
            ]
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
            "id": "bam",
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
        },
        {
            "type": "int",
            "id": "cpu",
            "inputBinding": {
                "position": 3,
                "separate": true,
                "prefix": "--nth"
            }
        },
        {
            "type": "boolean",
            "id": "multimapping",
            "inputBinding": {
                "position": 4,
                "separate": true,
                "prefix": "--multimapping"
            }
        },
        {
            "type": "boolean",
            "id": "dup_marker",
            "default": 'picard',
            "inputBinding": {
                "position": 5,
                "separate": true,
                "prefix": "--dup-marker"
            }
        },
        {
            "type": "boolean",
            "id": "mapq_thresh",
            "default": 30,
            "inputBinding": {
                "position": 6,
                "separate": true,
                "prefix": "--mapq-thresh"
            }
        },
        {
            "type": "boolean",
            "id": "no_dup_removal",
            "default": false,
            "inputBinding": {
                "position": 7,
                "separate": true,
                "prefix": "--no-dup-removal"
            }
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
