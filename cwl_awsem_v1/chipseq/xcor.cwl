#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
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
            "id": "ta"
        },
        {
            "type": "boolean",
            "id": "paired_end"
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
            "valueFrom": "python $(which encode_xcor.py) $(inputs.ta.path) $(\"--subsample \" + inputs.subsample) $(\"--nth \" + inputs.cpu)"
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