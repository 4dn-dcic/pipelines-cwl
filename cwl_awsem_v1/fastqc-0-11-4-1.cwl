{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#input_fastq", 
            "isArray": false, 
            "isFile": true, 
            "name": "input_fastq", 
            "type": [
                "File"
            ]
        }, 
        {
            "default": 1, 
            "doc": "Specifies the number of files which can be processed simultaneously.  Each thread will be allocated 250MB of memory so you shouldn't run more threads than your available memory will cope with, and not more than 6 threads on a 32 bit machine.", 
            "id": "#threads", 
            "isArray": false, 
            "isFile": false, 
            "name": "threads", 
            "type": [
                "null", 
                "int"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#report_zip", 
            "isArray": false, 
            "isFile": true, 
            "name": "report_zip", 
            "outputSource": "#FastQC/report_zip", 
            "source_arg": "report_zip", 
            "source_step": "FastQC", 
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
            "source_arg": "report_zip", 
            "source_step": "FastQC", 
            "target_arg": "report_zip"
        }, 
        {
            "source_arg": "threads", 
            "target_arg": "threads", 
            "target_step": "FastQC"
        }, 
        {
            "target_arg": "outdir", 
            "target_step": "FastQC"
        }, 
        {
            "source_arg": "input_fastq", 
            "target_arg": "input_fastq", 
            "target_step": "FastQC"
        }
    ], 
    "steps": [
        {
            "id": "#FastQC", 
            "in": [
                {
                    "arg_name": "threads", 
                    "id": "#FastQC/threads", 
                    "name": "FastQC.threads", 
                    "source": "#threads", 
                    "source_arg": "threads", 
                    "step_name": "FastQC"
                }, 
                {
                    "arg_name": "outdir", 
                    "id": "#FastQC/outdir", 
                    "name": "FastQC.outdir", 
                    "step_name": "FastQC"
                }, 
                {
                    "arg_name": "input_fastq", 
                    "id": "#FastQC/input_fastq", 
                    "name": "FastQC.input_fastq", 
                    "source": "#input_fastq", 
                    "source_arg": "input_fastq", 
                    "step_name": "FastQC"
                }
            ], 
            "name": "FastQC", 
            "out": [
                {
                    "arg_name": "report_zip", 
                    "id": "#FastQC/report_zip", 
                    "name": "FastQC.report_zip", 
                    "step_name": "FastQC"
                }
            ], 
            "run": "fastqc-0-11-4.cwl"
        }
    ]
}