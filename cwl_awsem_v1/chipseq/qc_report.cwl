{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*qc.html"
                ]
            },
            "type": "File",
            "id": "report"
        },
        {
            "outputBinding": {
                "glob": [
                    "*qc.json"
                ]
            },
            "type": "File",
            "id": "qc_json"
        },
        {
            "outputBinding": {
                "glob": "parseInt(inputs.qc_json_match.txt.contents)",
                "loadContents": true
            },
            "type": "boolean",
            "id": "qc_json_match"
        }
    ],
    "inputs": [
        {
            "type": "string?",
            "id": "name"
        },
        {
            "type": "string?",
            "id": "desc"
        },
        {
            "type": "boolean",
            "id": "paired_end"
        },
        {
            "type": "string",
            "id": "pipeline_type"
        },
        {
            "type": "string",
            "id": "peak_caller"
        },
        {
            "type": "float",
            "id": "idr_thresh"
        },
        {
            "type": "File[]?",
            "id": "flagstat_qcs"
        },
        {
            "type": "File[]?",
            "id": "nodup_flagstat_qcs"
        },
        {
            "type": "File[]?",
            "id": "dup_qcs"
        },
        {
            "type": "File[]?",
            "id": "pbc_qcs"
        },
        {
            "type": "File[]?",
            "id": "ctl_flagstat_qcs"
        },
        {
            "type": "File[]?",
            "id": "ctl_nodup_flagstat_qcs"
        },
        {
            "type": "File[]?",
            "id": "ctl_dup_qcs"
        },
        {
            "type": "File[]?",
            "id": "ctl_pbc_qcs"
        },
        {
            "type": "File[]?",
            "id": "xcor_plots"
        },
        {
            "type": "File[]?",
            "id": "xcor_scores"
        },
        {
            "type": "File?",
            "id": "jsd_plot"
        },
        {
            "type": "File[]?",
            "id": "jsd_qcs"
        },
        {
            "type": "File[]?",
            "id": "idr_plots"
        },
        {
            "type": "File[]?",
            "id": "idr_plots_pr"
        },
        {
            "type": "File?",
            "id": "idr_plot_ppr"
        },
        {
            "type": "File[]?",
            "id": "frip_macs2_qcs"
        },
        {
            "type": "File[]?",
            "id": "frip_macs2_qcs_pr1"
        },
        {
            "type": "File[]?",
            "id": "frip_macs2_qcs_pr2"
        },
        {
            "type": "File?",
            "id": "frip_macs2_qc_pooled"
        },
        {
            "type": "File?",
            "id": "frip_macs2_qc_ppr1"
        },
        {
            "type": "File?",
            "id": "frip_macs2_qc_ppr2"
        },
        {
            "type": "File[]?",
            "id": "frip_spp_qcs"
        },
        {
            "type": "File[]?",
            "id": "frip_spp_qcs_pr1"
        },
        {
            "type": "File[]?",
            "id": "frip_spp_qcs_pr2"
        },
        {
            "type": "File?",
            "id": "frip_spp_qc_pooled"
        },
        {
            "type": "File?",
            "id": "frip_spp_qc_ppr1"
        },
        {
            "type": "File?",
            "id": "frip_spp_qc_ppr2"
        },
        {
            "type": "File[]?",
            "id": "frip_idr_qcs"
        },
        {
            "type": "File[]?",
            "id": "frip_idr_qcs_pr"
        },
        {
            "type": "File?",
            "id": "frip_idr_qc_ppr"
        },
        {
            "type": "File[]?",
            "id": "frip_overlap_qcs"
        },
        {
            "type": "File[]?",
            "id": "frip_overlap_qcs_pr"
        },
        {
            "type": "File?",
            "id": "frip_overlap_qc_ppr"
        },
        {
            "type": "File?",
            "id": "idr_reproducibility_qc"
        },
        {
            "type": "File?",
            "id": "overlap_reproducibility_qc"
        },
        {
            "type": "File?",
            "id": "qc_json_ref"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "${            var flagstat_qcs_separated = '';            for (var i=0; i<inputs.flagstat_qcs.length; i++){                flagstat_qcs_separated = flagstat_qcs_separated + inputs.flagstat_qcs[i].path + ' ';            }            flagstat_qcs_separated = flagstat_qcs_separated.replace(/ $/, '');                        var nodup_flagstat_qcs_separated = '';            for (var i=0; i<inputs.nodup_flagstat_qcs.length; i++){                nodup_flagstat_qcs_separated = nodup_flagstat_qcs_separated + inputs.nodup_flagstat_qcs[i].path + ' ';            }            nodup_flagstat_qcs_separated = nodup_flagstat_qcs_separated.replace(/ $/, '');                        var dup_qcs_separated = '';            for (var i=0; i<inputs.dup_qcs.length; i++){                dup_qcs_separated = dup_qcs_separated + inputs.dup_qcs[i].path + ' ';            }            dup_qcs_separated = dup_qcs_separated.replace(/ $/, '');                        var pbc_qcs_separated = '';            for (var i=0; i<inputs.pbc_qcs.length; i++){                pbc_qcs_separated = pbc_qcs_separated + inputs.pbc_qcs[i].path + ' ';            }            pbc_qcs_separated = pbc_qcs_separated.replace(/ $/, '');                        var ctl_flagstat_qcs_separated = '';            for (var i=0; i<inputs.ctl_flagstat_qcs.length; i++){                ctl_flagstat_qcs_separated = ctl_flagstat_qcs_separated + inputs.ctl_flagstat_qcs[i].path + ' ';            }            ctl_flagstat_qcs_separated = ctl_flagstat_qcs_separated.replace(/ $/, '');                        var ctl_nodup_flagstat_qcs_separated = '';            for (var i=0; i<inputs.ctl_nodup_flagstat_qcs.length; i++){                ctl_nodup_flagstat_qcs_separated = ctl_nodup_flagstat_qcs_separated + inputs.ctl_nodup_flagstat_qcs[i].path + ' ';            }            ctl_nodup_flagstat_qcs_separated = ctl_nodup_flagstat_qcs_separated.replace(/ $/, '');                        var ctl_dup_qcs_separated = '';            for (var i=0; i<inputs.ctl_dup_qcs.length; i++){                ctl_dup_qcs_separated = ctl_dup_qcs_separated + inputs.ctl_dup_qcs[i].path + ' ';            }            ctl_dup_qcs_separated = ctl_dup_qcs_separated.replace(/ $/, '');                        var ctl_pbc_qcs_separated = '';            for (var i=0; i<inputs.ctl_pbc_qcs.length; i++){                ctl_pbc_qcs_separated = ctl_pbc_qcs_separated + inputs.ctl_pbc_qcs[i].path + ' ';            }            ctl_pbc_qcs_separated = ctl_pbc_qcs_separated.replace(/ $/, '');                        var xcor_plots_separated = '';            for (var i=0; i<inputs.xcor_plots.length; i++){                xcor_plots_separated = xcor_plots_separated + inputs.xcor_plots[i].path + ' ';            }            xcor_plots_separated = xcor_plots_separated.replace(/ $/, '');                        var xcor_scores_separated = '';            for (var i=0; i<inputs.xcor_scores.length; i++){                xcor_scores_separated = xcor_scores_separated + inputs.xcor_scores[i].path + ' ';            }            xcor_scores_separated = xcor_scores_separated.replace(/ $/, '');                        var jsd_qcs_separated = '';            for (var i=0; i<inputs.jsd_qcs.length; i++){                jsd_qcs_separated = jsd_qcs_separated + inputs.jsd_qcs[i].path + ' ';            }            jsd_qcs_separated = jsd_qcs_separated.replace(/ $/, '');                        var idr_plots_separated = '';            for (var i=0; i<inputs.idr_plots.length; i++){                idr_plots_separated = idr_plots_separated + inputs.idr_plots[i].path + ' ';            }            idr_plots_separated = idr_plots_separated.replace(/ $/, '');                        var idr_plots_pr_separated = '';            for (var i=0; i<inputs.idr_plots_pr.length; i++){                idr_plots_pr_separated = idr_plots_pr_separated + inputs.idr_plots_pr[i].path + ' ';            }            idr_plots_pr_separated = idr_plots_pr_separated.replace(/ $/, '');                        var frip_macs2_qcs_separated = '';            for (var i=0; i<inputs.frip_macs2_qcs.length; i++){                frip_macs2_qcs_separated = frip_macs2_qcs_separated + inputs.frip_macs2_qcs[i].path + ' ';            }            frip_macs2_qcs_separated = frip_macs2_qcs_separated.replace(/ $/, '');                        var frip_macs2_qcs_pr1_separated = '';            for (var i=0; i<inputs.frip_macs2_qcs_pr1.length; i++){                frip_macs2_qcs_pr1_separated = frip_macs2_qcs_pr1_separated + inputs.frip_macs2_qcs_pr1[i].path + ' ';            }            frip_macs2_qcs_pr1_separated = frip_macs2_qcs_pr1_separated.replace(/ $/, '');                        var frip_macs2_qcs_pr2_separated = '';            for (var i=0; i<inputs.frip_macs2_qcs_pr2.length; i++){                frip_macs2_qcs_pr2_separated = frip_macs2_qcs_pr2_separated + inputs.frip_macs2_qcs_pr2[i].path + ' ';            }            frip_macs2_qcs_pr2_separated = frip_macs2_qcs_pr2_separated.replace(/ $/, '');                        var frip_spp_qcs_separated = '';            for (var i=0; i<inputs.frip_spp_qcs.length; i++){                frip_spp_qcs_separated = frip_spp_qcs_separated + inputs.frip_spp_qcs[i].path + ' ';            }            frip_spp_qcs_separated = frip_spp_qcs_separated.replace(/ $/, '');                        var frip_spp_qcs_pr1_separated = '';            for (var i=0; i<inputs.frip_spp_qcs_pr1.length; i++){                frip_spp_qcs_pr1_separated = frip_spp_qcs_pr1_separated + inputs.frip_spp_qcs_pr1[i].path + ' ';            }            frip_spp_qcs_pr1_separated = frip_spp_qcs_pr1_separated.replace(/ $/, '');                        var frip_spp_qcs_pr2_separated = '';            for (var i=0; i<inputs.frip_spp_qcs_pr2.length; i++){                frip_spp_qcs_pr2_separated = frip_spp_qcs_pr2_separated + inputs.frip_spp_qcs_pr2[i].path + ' ';            }            frip_spp_qcs_pr2_separated = frip_spp_qcs_pr2_separated.replace(/ $/, '');                        var frip_idr_qcs_separated = '';            for (var i=0; i<inputs.frip_idr_qcs.length; i++){                frip_idr_qcs_separated = frip_idr_qcs_separated + inputs.frip_idr_qcs[i].path + ' ';            }            frip_idr_qcs_separated = frip_idr_qcs_separated.replace(/ $/, '');                        var frip_idr_qcs_pr_separated = '';            for (var i=0; i<inputs.frip_idr_qcs_pr.length; i++){                frip_idr_qcs_pr_separated = frip_idr_qcs_pr_separated + inputs.frip_idr_qcs_pr[i].path + ' ';            }            frip_idr_qcs_pr_separated = frip_idr_qcs_pr_separated.replace(/ $/, '');                        var frip_overlap_qcs_separated = '';            for (var i=0; i<inputs.frip_overlap_qcs.length; i++){                frip_overlap_qcs_separated = frip_overlap_qcs_separated + inputs.frip_overlap_qcs[i].path + ' ';            }            frip_overlap_qcs_separated = frip_overlap_qcs_separated.replace(/ $/, '');                        var frip_overlap_qcs_pr_separated = '';            for (var i=0; i<inputs.frip_overlap_qcs_pr.length; i++){                frip_overlap_qcs_pr_separated = frip_overlap_qcs_pr_separated + inputs.frip_overlap_qcs_pr[i].path + ' ';            }            frip_overlap_qcs_pr_separated = frip_overlap_qcs_pr_separated.replace(/ $/, '');            return \"\t\tpython \" + which encode_qc_report.py + \" \" + \"--name '\" + inputs.name + \"'\" + \" \" + \"--desc '\" + inputs.desc + \"'\" + \" --pipeline-type \" + inputs.pipeline_type + \" --peak-caller \" + inputs.peak_caller + \" --idr-thresh \" + inputs.idr_thresh + \" --flagstat-qcs \" + flagstat_qcs_separated + \" --nodup-flagstat-qcs \" + nodup_flagstat_qcs_separated + \" --dup-qcs \" + dup_qcs_separated + \" --pbc-qcs \" + pbc_qcs_separated + \" --ctl-flagstat-qcs \" + ctl_flagstat_qcs_separated + \" --ctl-nodup-flagstat-qcs \" + ctl_nodup_flagstat_qcs_separated + \" --ctl-dup-qcs \" + ctl_dup_qcs_separated + \" --ctl-pbc-qcs \" + ctl_pbc_qcs_separated + \" --xcor-plots \" + xcor_plots_separated + \" --xcor-scores \" + xcor_scores_separated + \" \" + \"--jsd-plot \" + inputs.jsd_plot + \" --jsd-qcs \" + jsd_qcs_separated + \" --idr-plots \" + idr_plots_separated + \" --idr-plots-pr \" + idr_plots_pr_separated + \" \" + \"--idr-plot-ppr \" + inputs.idr_plot_ppr + \" --frip-macs2-qcs \" + frip_macs2_qcs_separated + \" --frip-macs2-qcs-pr1 \" + frip_macs2_qcs_pr1_separated + \" --frip-macs2-qcs-pr2 \" + frip_macs2_qcs_pr2_separated + \" \" + \"--frip-macs2-qc-pooled \" + inputs.frip_macs2_qc_pooled + \" \" + \"--frip-macs2-qc-ppr1 \" + inputs.frip_macs2_qc_ppr1 + \" \" + \"--frip-macs2-qc-ppr2 \" + inputs.frip_macs2_qc_ppr2 + \" --frip-spp-qcs \" + frip_spp_qcs_separated + \" --frip-spp-qcs-pr1 \" + frip_spp_qcs_pr1_separated + \" --frip-spp-qcs-pr2 \" + frip_spp_qcs_pr2_separated + \" \" + \"--frip-spp-qc-pooled \" + inputs.frip_spp_qc_pooled + \" \" + \"--frip-spp-qc-ppr1 \" + inputs.frip_spp_qc_ppr1 + \" \" + \"--frip-spp-qc-ppr2 \" + inputs.frip_spp_qc_ppr2 + \" --frip-idr-qcs \" + frip_idr_qcs_separated + \" --frip-idr-qcs-pr \" + frip_idr_qcs_pr_separated + \" \" + \"--frip-idr-qc-ppr \" + inputs.frip_idr_qc_ppr + \" --frip-overlap-qcs \" + frip_overlap_qcs_separated + \" --frip-overlap-qcs-pr \" + frip_overlap_qcs_pr_separated + \" \" + \"--frip-overlap-qc-ppr \" + inputs.frip_overlap_qc_ppr + \" \" + \"--idr-reproducibility-qc \" + inputs.idr_reproducibility_qc + \" \" + \"--overlap-reproducibility-qc \" + inputs.overlap_reproducibility_qc + \" --out-qc-html qc.html --out-qc-json qc.json\t\"}"
        }
    ],
    "id": "qc_report",
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
