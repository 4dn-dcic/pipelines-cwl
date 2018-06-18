#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.png"
                ]
            },
            "type": "File",
            "id": "plot"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.jsd.qc"
                ]
            },
            "type": "File[]",
            "id": "jsd_qcs"
        }
    ],
    "inputs": [
        {
            "type": "File[]",
            "id": "nodup_bams"
        },
        {
            "type": "File",
            "id": "ctl_bam"
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
            "valueFrom": "${            var nodup_bams_separated = '';            for (var i=0; i<inputs.nodup_bams.length; i++){                nodup_bams_separated = nodup_bams_separated + inputs.nodup_bams[i].path + ' ';            }            nodup_bams_separated = nodup_bams_separated.replace(/ $/, '');            return \"\t\tpython \" + which encode_fingerprint.py + \" \" + nodup_bams_separated + \" --ctl-bam \" + inputs.ctl_bam.path + \" \" + \"--blacklist \" + inputs.blacklist.path + \" \" + \"--nth \" + inputs.cpu + \"\t\"}"
        }
    ],
    "id": "fingerprint",
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