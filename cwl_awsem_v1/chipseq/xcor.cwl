#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2
# and then extensively modified by Soo Lee
{
    "class": "CommandLineTool",
    "baseCommand": ["encode_xcor.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.cc.plot.pdf"
                ]
            },
            "type": "File",
            "id": "plot_pdf"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.cc.plot.png"
                ]
            },
            "type": "File",
            "id": "plot_png"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.cc.qc"
                ]
            },
            "type": "File",
            "id": "score"
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
        },
        {
            "type": "int",
            "id": "cpu",
            "default": 2,
            "inputBinding": {
                "position": 3,
                "separate": true,
                "prefix": "--nth"
            }
        },
        {
            "type": "int",
            "id": "subsample",
            "default": 15000000,
            "inputBinding": {
                "position": 4,
                "separate": true,
                "prefix": "--subsample"
            }
        }
    ],
    "id": "xcor",
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
