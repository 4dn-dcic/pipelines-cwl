{
    "class": "CommandLineTool",
    "stdout": "__stdout",
    "baseCommand": [],
    "outputs": [
        {
            "outputBinding": {
                "glob": "parseInt(self[0].contents)",
                "loadContents": true
            },
            "type": "int",
            "id": "rounded_mean"
        }
    ],
    "inputs": [
        {
            "type": "int[]",
            "id": "ints"
        }
    ],
    "arguments": [
        {
            "shellQuote": false,
            "valueFrom": "${            var ints_separated = '';            for (var i=0; i<inputs.ints.length; i++){                ints_separated = ints_separated + inputs.ints[i].path + ',';            }            ints_separated = ints_separated.replace(/,$/, '');            return \"\t\tpython <<CODE\t\tarr = [\" + ints_separated + \"]\t\tif len(arr):\t\t    sum_ = sum(arr)\t\t    mean_ = sum(arr)/float(len(arr))\t\t    print(int(round(mean_)))\t\telse:\t\t    print()\t\tCODE\t\"}"
        }
    ],
    "id": "rounded_mean",
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
