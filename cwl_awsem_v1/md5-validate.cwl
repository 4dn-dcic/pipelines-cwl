{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#input_file", 
            "type": [
                "null", 
                "File"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#validatefiles_report", 
            "outputSource": "#validatefiles/report", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#md5_report", 
            "outputSource": "#md5/report", 
            "type": [
                "null", 
                "File"
            ]
        }
    ], 
    "requirements": [
        {
            "class": "InlineJavascriptRequirement"
        }
    ], 
    "steps": [
        {
            "id": "#md5", 
            "in": [
                {
                    "arg_name": "input_file", 
                    "id": "#md5/input_file", 
                    "source": "#input_file"
                }
            ], 
            "out": [
                {
                    "arg_name": "report", 
                    "id": "#md5/report"
                }
            ], 
            "run": "md5.cwl"
        }, 
        {
            "id": "#validatefiles", 
            "in": [
                {
                    "arg_name": "input_file", 
                    "id": "#validatefiles/input_file", 
                    "source": "#input_file"
                }
            ], 
            "out": [
                {
                    "arg_name": "report", 
                    "id": "#validatefiles/report"
                }
            ], 
            "run": "validate.cwl"
        }
    ]
}