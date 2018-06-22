{
    "class": "CommandLineTool",
    "baseCommand": ["encode_pool_ta.py"],
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
           "type": {
                "type": "array",
                "items": "File"
            },
            "id": "tas",
            "inputBinding": {
                "position": 2
            }
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
