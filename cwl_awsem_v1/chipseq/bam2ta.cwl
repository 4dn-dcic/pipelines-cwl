{
    "class": "CommandLineTool",
    "baseCommand": ["encode_bam2ta.py"],
    "outputs": [
        {
            "outputBinding": {
                "glob": [
                    "*.tagAlign.gz"
                ]
            },
            "type": "File",
            "id": "ta"
        }
    ],
    "inputs": [
        {
            "type": "File",
            "id": "bam",
            "inputBinding": {
                "position": 1
            }
        },
        {
            "type": "boolean",
            "id": "paired_end",
            "default": false,
            "inputBinding": {
                "position": 2,
                "separate": true,
                "prefix": "--paired-end"
            }
        },
        {
            "type": "int",
            "id": "cpu",
            "inputBinding": {
                "position": 3,
                "separate": true,
                "prefix": "--nth"
            }
        },
        {
            "type": "string",
            "id": "regex_grep_v_ta",
            "default": "chrM",
            "inputBinding": {
                "position": 4,
                "separate": true,
                "prefix": "--regex-grep-v-ta"
            }
        },
        {
            "type": "int",
            "id": "subsample",
            "default": 0,
            "inputBinding": {
                "position": 5,
                "separate": true,
                "prefix": "--subsample"
            }
        },
        {
            "type": "boolean",
            "id": "disable_tn5_shift",
            "default": false,
            "inputBinding": {
                "position": 6,
                "separate": true,
                "prefix": "--disable-tn5-shift"
            }
        }
    ],
    "id": "bam2ta",
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
