#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*[!.][!b][!f][!i][!l][!t].regionPeak.gz"
                ]
            },
            "type": "File",
            "id": "rpeak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.regionPeak.gz"
                ]
            },
            "type": "File",
            "id": "bfilt_rpeak"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bfilt.regionPeak.bb"
                ]
            },
            "type": "File",
            "id": "bfilt_rpeak_peak_bb"
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
            "type": "File",
            "id": "chrsz"
        },
        {
            "type": "int?",
            "id": "cap_num_peak"
        },
        {
            "type": "File",
            "id": "blacklist"
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
            "valueFrom": "${            var tas_separated = '';            for (var i=0; i<inputs.tas.length; i++){                tas_separated = tas_separated + inputs.tas[i].path + ' ';            }            tas_separated = tas_separated.replace(/ $/, '');            return \"\t\tpython \" + which encode_spp.py + \" \" + tas_separated + \" \" + \"--chrsz \" + inputs.chrsz.path + \" \" + \"--fraglen \" + inputs.fraglen + \" \" + \"--cap-num-peak \" + inputs.cap_num_peak + \" \" + \"--nth \" + inputs.cpu + \" \" + \"--blacklist \" + inputs.blacklist.path + \"\t\"}"
        }
    ],
    "id": "spp",
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