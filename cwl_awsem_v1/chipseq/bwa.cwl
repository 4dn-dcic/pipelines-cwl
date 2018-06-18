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
            "id": "bam"
        },
        {
            "outputBinding": {
                "glob": [
                    "*.bai"
                ]
            },
            "type": "File",
            "id": "bai"
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
            "id": "idx_tar"
        },
        {
            "type": "File[]",
            "id": "fastqs"
        },
        {
            "type": "boolean",
            "id": "paired_end"
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
            "valueFrom": "${            var fastqs_separated = '';            for (var i=0; i<inputs.fastqs.length; i++){                fastqs_separated = fastqs_separated + inputs.fastqs[i].path + ' ';            }            fastqs_separated = fastqs_separated.replace(/ $/, '');            return \"\t\tpython \" + which encode_bwa.py + \" \" + inputs.idx_tar.path + \" \" + fastqs_separated + \" \" + \"--nth \" + inputs.cpu + \"\t\"}"
        }
    ],
    "id": "bwa",
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