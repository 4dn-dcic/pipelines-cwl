#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*[!.][!b][!f][!i][!l][!t].narrowPeak.gz"
                ]
            },
            "type": "File",
            "id": "npeak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.narrowPeak.gz"
                ]
            },
            "type": "File",
            "id": "bfilt_npeak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.narrowPeak.bb"
                ]
            },
            "type": "File",
            "id": "bfilt_npeak_bb"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.frip.qc"
                ]
            },
            "type": "File",
            "id": "frip_qc"
        }
    ],
    "inputs": [
        {
            "type": "File[]",
            "id": "tas"
        },
        {
            "type": "int",
            "id": "fraglen"
        },
        {
            "type": "string",
            "id": "gensz"
        },
        {
            "type": "File",
            "id": "chrsz"
        },
        {
            "type": "int?",
            "id": "cap_num_peak"
        },
        {
            "type": "float?",
            "id": "pval_thresh"
        },
        {
            "type": "boolean?",
            "id": "make_signal"
        },
        {
            "type": "File",
            "id": "blacklist"
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
            "valueFrom": "${            var tas_separated = '';            for (var i=0; i<inputs.tas.length; i++){                tas_separated = tas_separated + inputs.tas[i].path + ' ';            }            tas_separated = tas_separated.replace(/ $/, '');            return \"\t\tpython \" + which encode_macs2_chip.py + \" \" + tas_separated + \" \" + \"--gensz \" + inputs.gensz + \" \" + \"--chrsz \" + inputs.chrsz.path + \" \" + \"--fraglen \" + inputs.fraglen + \" \" + \"--cap-num-peak \" + inputs.cap_num_peak + \" \" + \"--pval-thresh \" + inputs.pval_thresh + \" \" + \"--blacklist \" + inputs.blacklist.path + \"\t\ttouch null # ugly part to deal with optional outputs\t\"}"
        }
    ],
    "id": "macs2",
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