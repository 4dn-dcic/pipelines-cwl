{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#input_file", 
            "isArray": false, 
            "isFile": true, 
            "name": "input_file", 
            "type": [
                "null", 
                "File"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#validatefiles_report", 
            "isArray": false, 
            "isFile": true, 
            "name": "validatefiles_report", 
            "outputSource": "#validatefiles/report", 
            "source_arg": "report", 
            "source_step": "validatefiles", 
            "type": [
                "null", 
                "File"
            ]
        }, 
        {
            "id": "#md5_report", 
            "isArray": false, 
            "isFile": true, 
            "name": "md5_report", 
            "outputSource": "#md5/report", 
            "source_arg": "report", 
            "source_step": "md5", 
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
    "sourcetarget_list": [
        {
            "source_arg": "report", 
            "source_step": "validatefiles", 
            "target_arg": "validatefiles_report"
        }, 
        {
            "source_arg": "report", 
            "source_step": "md5", 
            "target_arg": "md5_report"
        }, 
        {
            "source_arg": "input_file", 
            "target_arg": "input_file", 
            "target_step": "md5"
        }, 
        {
            "source_arg": "input_file", 
            "target_arg": "input_file", 
            "target_step": "validatefiles"
        }
    ], 
    "steps": [
        {
            "id": "#md5", 
            "in": [
                {
                    "arg_name": "input_file", 
                    "id": "#md5/input_file", 
                    "name": "md5.input_file", 
                    "source": "#input_file", 
                    "source_arg": "input_file", 
                    "step_name": "md5"
                }
            ], 
            "name": "md5", 
            "out": [
                {
                    "arg_name": "report", 
                    "id": "#md5/report", 
                    "name": "md5.report", 
                    "step_name": "md5"
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
                    "name": "validatefiles.input_file", 
                    "source": "#input_file", 
                    "source_arg": "input_file", 
                    "step_name": "validatefiles"
                }
            ], 
            "name": "validatefiles", 
            "out": [
                {
                    "arg_name": "report", 
                    "id": "#validatefiles/report", 
                    "name": "validatefiles.report", 
                    "step_name": "validatefiles"
                }
            ], 
            "run": "validate.cwl"
        }
    ]
}