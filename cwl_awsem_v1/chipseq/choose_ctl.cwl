#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "ctl_for_rep*.tagAlign.gz"
                ]
            },
            "type": "File[]",
            "id": "chosen_ctl_tas"
        }
    ],
    "inputs": [
        {
            "type": "File[]",
            "id": "tas"
        },
        {
            "type": "File[]",
            "id": "ctl_tas"
        },
        {
            "type": "File?",
            "id": "ta_pooled"
        },
        {
            "type": "File?",
            "id": "ctl_ta_pooled"
        },
        {
            "type": "boolean?",
            "id": "always_use_pooled_ctl"
        },
        {
            "type": "float?",
            "id": "ctl_depth_ratio"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "${            var tas_separated = '';            for (var i=0; i<inputs.tas.length; i++){                tas_separated = tas_separated + inputs.tas[i].path + ' ';            }            tas_separated = tas_separated.replace(/ $/, '');                        var ctl_tas_separated = '';            for (var i=0; i<inputs.ctl_tas.length; i++){                ctl_tas_separated = ctl_tas_separated + inputs.ctl_tas[i].path + ' ';            }            ctl_tas_separated = ctl_tas_separated.replace(/ $/, '');            return \"\t\tpython \" + which encode_choose_ctl.py + \" --tas \" + tas_separated + \" --ctl-tas \" + ctl_tas_separated + \" \" + \"--ta-pooled \" + inputs.ta_pooled + \" \" + \"--ctl-ta-pooled \" + inputs.ctl_ta_pooled + \" \" + \"--ctl-depth-ratio \" + inputs.ctl_depth_ratio + \"\t\"}"
        }
    ],
    "id": "choose_ctl",
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