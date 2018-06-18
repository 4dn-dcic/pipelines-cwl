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
            "id": "overlap_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.\" + peak_type + \".gz"
                ]
            },
            "type": "File",
            "id": "bfilt_overlap_peak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.\" + peak_type + \".bb"
                ]
            },
            "type": "File",
            "id": "bfilt_overlap_peak_bb"
        }
    ],
    "inputs": [
        {
            "type": "string",
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
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "python $(which encode_naive_overlap.py) $(inputs.peak1.path) $(inputs.peak2.path) $(inputs.peak_pooled.path) $(\"--prefix \" + inputs.prefix) $(\"--peak-type \" + inputs.peak_type) $(\"--fraglen \" + inputs.fraglen) $(\"--chrsz \" + inputs.chrsz.path) $(\"--blacklist \" + inputs.blacklist.path) $(\"--ta \" + inputs.ta)\t\t# ugly part to deal with optional outputs with Google backend\t\ttouch null"
        }
    ],
    "id": "overlap",
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