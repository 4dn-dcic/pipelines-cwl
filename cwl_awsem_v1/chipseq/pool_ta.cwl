#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.tagAlign.gz"
                ]
            },
            "type": "File",
            "id": "ta_pooled"
        }
    ],
    "inputs": [
        {
            "type": "File[]",
            "id": "tas"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "${            var tas_separated = '';            for (var i=0; i<inputs.tas.length; i++){                tas_separated = tas_separated + inputs.tas[i].path + ' ';            }            tas_separated = tas_separated.replace(/ $/, '');            return \"\t\tpython \" + which encode_pool_ta.py + \" \" + tas_separated + \"\t\"}"
        }
    ],
    "id": "pool_ta",
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