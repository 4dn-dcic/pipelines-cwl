#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*[!.][!b][!f][!i][!l][!t].\" + peak_type + \".gz"
                ]
            },
            "type": "File",
            "id": "idr_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.\" + peak_type + \".gz"
                ]
            },
            "type": "File",
            "id": "bfilt_idr_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.\" + peak_type + \".bb"
                ]
            },
            "type": "File",
            "id": "bfilt_idr_peak_bb"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.txt.png"
                ]
            },
            "type": "File",
            "id": "idr_plot"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.txt.gz"
                ]
            },
            "type": "File",
            "id": "idr_unthresholded_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.log"
                ]
            },
            "type": "File",
            "id": "idr_log"
        }
    ],
    "inputs": [
        {
            "type": "string?",
            "id": "prefix"
        },
        {
            "type": "File",
            "id": "peak1"
        },
        {
            "type": "File",
            "id": "peak2"
        },
        {
            "type": "File",
            "id": "peak_pooled"
        },
        {
            "type": "float?",
            "id": "idr_thresh"
        },
        {
            "type": "File",
            "id": "blacklist"
        },
        {
            "type": "File?",
            "id": "ta"
        },
        {
            "type": "int",
            "id": "fraglen"
        },
        {
            "type": "File",
            "id": "chrsz"
        },
        {
            "type": "string",
            "id": "peak_type"
        },
        {
            "type": "string",
            "id": "rank"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "python $(which encode_idr.py) $(inputs.peak1.path) $(inputs.peak2.path) $(inputs.peak_pooled.path) $(\"--prefix \" + inputs.prefix) $(\"--idr-thresh \" + inputs.idr_thresh) $(\"--peak-type \" + inputs.peak_type) --idr-rank $(inputs.rank) $(\"--fraglen \" + inputs.fraglen) $(\"--chrsz \" + inputs.chrsz.path) $(\"--blacklist \" + inputs.blacklist.path) $(\"--ta \" + inputs.ta)\t\t# ugly part to deal with optional outputs with Google backend\t\ttouch null"
        }
    ],
    "id": "idr",
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