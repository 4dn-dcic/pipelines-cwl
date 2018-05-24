{
    "class": "Workflow", 
    "cwlVersion": "v1.0", 
    "inputs": [
        {
            "id": "#input_fastq", 
            "type": [
                "File"
            ]
        }, 
        {
            "default": 1, 
            "doc": "Specifies the number of files which can be processed simultaneously.  Each thread will be allocated 250MB of memory so you shouldn't run more threads than your available memory will cope with, and not more than 6 threads on a 32 bit machine.", 
            "id": "#threads", 
            "type": [
                "null", 
                "int"
            ]
        }
    ], 
    "outputs": [
        {
            "id": "#report_zip", 
            "outputSource": "#FastQC/report_zip", 
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
            "id": "#FastQC", 
            "in": [
                {
                    "arg_name": "threads", 
                    "id": "#FastQC/threads", 
                    "source": "#threads"
                }, 
                {
                    "arg_name": "outdir", 
                    "id": "#FastQC/outdir"
                }, 
                {
                    "arg_name": "input_fastq", 
                    "id": "#FastQC/input_fastq", 
                    "source": "#input_fastq"
                }
            ], 
            "out": [
                {
                    "arg_name": "report_zip", 
                    "id": "#FastQC/report_zip"
                }
            ], 
            "run": "fastqc-0-11-4.cwl"
        }
    ]
}