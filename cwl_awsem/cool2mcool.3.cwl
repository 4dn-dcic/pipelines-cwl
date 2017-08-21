{
    "outputs": [
        {
            "type": [
                "null",
                "File"
            ],
            "outputBinding": {
                "glob": "*.multires.cool *.mcool"
            },
            "id": "#output_mcool"
        }
    ],
    "hints": [
        {
            "class": "DockerRequirement",
            "dockerPull": "duplexa/4dn-hic:v17"
        }
    ],
    "cwlVersion": "draft-3",
    "baseCommand": [
        "run-cool2multirescool.sh"
    ],
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }
    ],
    "class": "CommandLineTool",
    "inputs": [
        {
            "type": [
                "null",
                "File"
            ],
            "inputBinding": {
                "separate": true,
                "position": 1
            },
            "id": "#input_cool"
        },
        {
            "default": 4,
            "type": [
                "null",
                "int"
            ],
            "inputBinding": {
                "separate": true,
                "position": 2
            },
            "id": "#ncores"
        },
        {
            "default": "out",
            "type": [
                "null",
                "string"
            ],
            "inputBinding": {
                "separate": true,
                "position": 3
            },
            "id": "#outprefix"
        }
    ],
    "arguments": []
}