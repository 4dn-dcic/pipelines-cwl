{
    "class": "CommandLineTool",
    "baseCommand": [],
    "outputs": [],
    "inputs": [
        {
            "type": "File",
            "id": "genome_tsv"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "echo \"Reading genome_tsv $(inputs.genome_tsv.path) ...\""
        }
    ],
    "id": "read_genome_tsv",
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
