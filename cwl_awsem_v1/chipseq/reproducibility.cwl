#!/usr/bin/env cwl-runner
# This tool description was generated automatically by wdl2cwl ver. 0.2

{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*reproducibility.qc"
                ]
            },
            "type": "File",
            "id": "reproducibility_qc"
        }
    ],
    "inputs": [
        {
            "type": "string",
            "id": "prefix"
        },
        {
            "type": "File[]",
            "id": "peaks"
        },
        {
            "type": "File[]",
            "id": "peaks_pr"
        },
        {
            "type": "File?",
            "id": "peak_ppr"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "${            var peaks_separated = '';            for (var i=0; i<inputs.peaks.length; i++){                peaks_separated = peaks_separated + inputs.peaks[i].path + ' ';            }            peaks_separated = peaks_separated.replace(/ $/, '');                        var peaks_pr_separated = '';            for (var i=0; i<inputs.peaks_pr.length; i++){                peaks_pr_separated = peaks_pr_separated + inputs.peaks_pr[i].path + ' ';            }            peaks_pr_separated = peaks_pr_separated.replace(/ $/, '');            return \"\t\tpython \" + which encode_reproducibility_qc.py + \" \" + peaks_separated + \" --peaks-pr \" + peaks_pr_separated + \" \" + \"--peak-ppr \" + inputs.peak_ppr + \" --prefix \" + inputs.prefix + \"\t\"}"
        }
    ],
    "id": "reproducibility",
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