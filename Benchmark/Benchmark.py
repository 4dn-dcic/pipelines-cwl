from Benchmark.bfunctions import *

# input_json is a dictionary with two keys:
#   'input_size_in_bytes' and 'parameters'
# The value of 'input_size_in_bytes' is a dictionary,
# with input_argument_name as key and file size in bytes as value
# The value of 'parameters' is also a dictionary
# with input_argument_name as key and parameter value as value.
# return values:
#     total_size(GB), total_mem(MB), number_of_CPUs_required
#     AWS-related information including :
#         recommended_instance_type, ebs_size, EBS_optimized.


app_name_function_map = {
    'md5': md5,
    'fastqc-0-11-4-1': fastqc_0_11_4_1,
    'bwa-mem': bwa_mem,
    'pairsam-parse-sort': pairsam_parse_sort,
    'pairsam-merge': pairsam_merge,
    'pairsam-markasdup': pairsam_markasdup,
    'pairsam-filter': pairsam_filter,
    'pairs-patch': pairs_patch,
    'addfragtopairs': addfragtopairs,
    'hi-c-processing-partb': hi_c_processing_partb,
    'hi-c-processing-partc': hi_c_processing_partc,
    'hi-c-processing-bam': hi_c_processing_bam,
    'hi-c-processing-pairs': hi_c_processing_pairs,
    'repliseq-parta': repliseq_parta,
    'pairsqc-single': pairsqc_single
}


def benchmark(app_name, input_json, raise_error=False):
    if app_name in app_name_function_map:
        return(app_name_function_map[app_name](input_json))
    else:
        if raise_error:
            raise AppNameUnavailableException()
        else:
            return(None)


# Exceptions
class AppNameUnavailableException(Exception):
    def __init__(self, value=None):
        if not value:
            self.value = "Benchmark is unavailable for \
                          the corresponding app_name"
