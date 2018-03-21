from Benchmark.byteformat import *
from Benchmark.classes import BenchmarkResult


def md5(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_file' in input_json.get('input_size_in_bytes')
    input_in_bytes = input_json.get('input_size_in_bytes').get('input_file')
    input_size = B2GB(input_in_bytes) + 3
    r = BenchmarkResult(size=input_size,
                        mem=1024,
                        cpu=1)

    return(r.as_dict())


def fastqc_0_11_4_1(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_fastq' in input_json.get('input_size_in_bytes')

    nthreads = 1  # default value according to the cwl
    if 'parameters' in input_json:
        if 'threads' in input_json.get('parameters'):
            nthreads = input_json.get('parameters').get('threads')

    input_in_bytes = input_json.get('input_size_in_bytes').get('input_fastq')
    input_size = B2GB(input_in_bytes) * 2 + 3
    mem = 300 * nthreads
    if mem < 1024:
        mem = 1024
    r = BenchmarkResult(size=input_size,
                        mem=mem,
                        cpu=nthreads)

    return(r.as_dict())


def bwa_mem(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'fastq1' in input_json.get('input_size_in_bytes')
    assert 'fastq2' in input_json.get('input_size_in_bytes')
    assert 'bwa_index' in input_json.get('input_size_in_bytes')

    # cpu
    nthreads = 4  # default from cwl
    if 'parameters' in input_json:
        if 'nThreads' in input_json.get('parameters'):
            nthreads = input_json.get('parameters').get('nThreads')

    # space
    input_sizes = input_json.get('input_size_in_bytes')
    data_input_size = input_sizes.get('fastq1') + input_sizes.get('fastq2')
    total_input_size = data_input_size + input_sizes.get('bwa_index')
    output_bam_size = data_input_size * 2
    intermediate_index_size = input_sizes.get('bwa_index') * 2
    copied_input_size = data_input_size * 7  # copied and unzipped
    total_intermediate_size \
        = intermediate_index_size + output_bam_size + copied_input_size
    total_output_size = output_bam_size
    additional_size_in_gb = 10

    total_file_size_in_bp \
        = total_input_size + total_intermediate_size + total_output_size
    total_size = B2GB(total_file_size_in_bp) + additional_size_in_gb

    # mem
    mem = B2MB(input_sizes.get('bwa_index') * 4) + (nthreads * 500)

    r = BenchmarkResult(size=total_size, mem=mem, cpu=nthreads)

    return(r.as_dict())


def pairsam_parse_sort(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'bam' in input_json.get('input_size_in_bytes')

    # cpu
    nthreads = 8  # default from cwl
    if 'parameters' in input_json:
        if 'nThreads' in input_json.get('parameters'):
            nthreads = input_json.get('parameters').get('nThreads')

    in_size = input_json.get('input_size_in_bytes')
    bamsize = B2GB(in_size.get('bam'))
    pairsamsize = bamsize * 10  # very rough number
    tmp_pairsamsize = pairsamsize
    total_size = bamsize + pairsamsize + tmp_pairsamsize
    mem = 48000  # very rough number

    r = BenchmarkResult(size=total_size, mem=mem, cpu=nthreads * 2)

    return(r.as_dict())


def pairsam_merge(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_pairsams' in input_json.get('input_size_in_bytes')
    in_size = input_json['input_size_in_bytes']
    assert isinstance(in_size['input_pairsams'], list)

    # cpu
    nthreads = 8  # default from cwl
    if 'parameters' in input_json:
        if 'nThreads' in input_json.get('parameters'):
            nthreads = input_json.get('parameters').get('nThreads')

    # space
    input_size = B2GB(sum(in_size['input_pairsams']))
    total_size = input_size * 3
    total_safe_size = total_size * 2

    # mem
    mem = 4000

    # 32 cores: 1.8G/min (c4.8xlarge), 8 cores: 0.9G/min (r4.2xlarge)

    r = BenchmarkResult(size=total_safe_size, mem=mem, cpu=nthreads)
    return(r.as_dict())


def pairsam_markasdup(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_pairsam' in input_json.get('input_size_in_bytes')

    cpu = 1  # very rough estimate
    mem = 15000  # very rough estimate

    # space
    insize = B2GB(input_json['input_size_in_bytes']['input_pairsam'])
    outsize = insize
    intersize = outsize
    total_size = insize + outsize + intersize
    total_safe_size = total_size * 2

    r = BenchmarkResult(size=total_safe_size, mem=mem, cpu=cpu)
    return(r.as_dict())


def pairsam_filter(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_pairsam' in input_json.get('input_size_in_bytes')

    cpu = 4  # very rough estimate
    mem = 16000  # very rough estimate

    # space
    insize = B2GB(input_json['input_size_in_bytes']['input_pairsam'])
    outbamsize = insize
    outpairssize = insize  # to be safe
    outsize = outbamsize + outpairssize
    intersize = outsize
    total_size = insize + outsize + intersize
    total_safe_size = total_size * 2

    r = BenchmarkResult(size=total_safe_size, mem=mem, cpu=cpu)
    return(r.as_dict())


def addfragtopairs(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_pairs' in input_json.get('input_size_in_bytes')

    cpu = 1  # very rough estimate
    mem = 1024  # very rough estimate

    # space
    insize = B2GB(input_json['input_size_in_bytes']['input_pairs'])
    outsize = insize * 2
    intersize = outsize
    total_size = insize + outsize + intersize
    total_safe_size = total_size * 2

    r = BenchmarkResult(size=total_safe_size, mem=mem, cpu=cpu)
    return(r.as_dict())


def pairs_patch(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_pairs' in input_json.get('input_size_in_bytes')

    cpu = 1  # very rough estimate
    mem = 1024  # very rough estimate

    # space
    insize = B2GB(input_json['input_size_in_bytes']['input_pairs'])
    outsize = insize * 2
    intersize = outsize
    total_size = insize + outsize + intersize
    total_safe_size = total_size * 2

    r = BenchmarkResult(size=total_safe_size, mem=mem, cpu=cpu)
    return(r.as_dict())


def pairsqc_single(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_pairs' in input_json.get('input_size_in_bytes')

    cpu = 1  # very rough estimate
    mem = 1024  # very rough estimate

    # space
    insize = B2GB(input_json['input_size_in_bytes']['input_pairs'])
    outsize = 0
    intersize = 0
    total_size = insize + outsize + intersize
    total_safe_size = total_size * 2

    r = BenchmarkResult(size=total_safe_size, mem=mem, cpu=cpu)
    return(r.as_dict())


def hi_c_processing_partb(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_pairs' in input_json.get('input_size_in_bytes')
    in_size = input_json['input_size_in_bytes']
    assert isinstance(in_size['input_pairs'], list)

    # cpu
    nthreads = 8  # default from cwl
    if 'parameters' in input_json:
        if 'ncores' in input_json.get('parameters'):
            nthreads = input_json.get('parameters').get('ncores')

    # space
    input_size = B2GB(sum(in_size['input_pairs']))
    out_pairs_size = input_size
    out_cool_size = input_size
    out_hic_size = input_size
    out_size = out_pairs_size + out_cool_size + out_hic_size
    total_size = input_size + out_size
    total_safe_size = total_size * 2

    # mem
    maxmem = MB2GB(14)  # default from cwl
    if 'parameters' in input_json:
        if 'maxmem' in input_json.get('parameters'):
            maxmem = input_json.get('parameters').get('maxmem')
            if 'g' in maxmem:
                maxmem = GB2MB(int(maxmem.replace('g', '')))
            elif 'm' in maxmem:
                maxmem = int(maxmem.replace('m', ''))
            else:
                raise Exception("proper maxmem string?")

    cooler_mem = GB2MB(nthreads * input_size)
    if cooler_mem > maxmem:
        mem = cooler_mem
    else:
        mem = maxmem

    r = BenchmarkResult(size=total_safe_size, mem=mem, cpu=nthreads)
    return(r.as_dict())


def hi_c_processing_partc(input_json):
    assert 'input_size_in_bytes' in input_json
    insize = input_json.get('input_size_in_bytes')
    assert 'input_cool' in insize
    assert 'input_hic' in insize

    nthreads = 1  # default value according to the cwl
    nres = 13  # default value according to the cwl
    if 'parameters' in input_json:
        if 'ncores' in input_json.get('parameters'):
            nthreads = input_json.get('parameters').get('ncores')
        if 'nres' in input_json.get('parameters'):
            nres = input_json.get('parameters').get('nres')

    input_size = insize['input_cool'] + insize['input_hic']
    out_size = input_size * nres
    inter_size = out_size
    total_size = B2GB(input_size + out_size + inter_size)
    total_safe_size = total_size * 2

    cpu = nthreads
    mem = B2MB(nthreads * input_size * 5)
    if mem < 1024:
        mem = 1024

    r = BenchmarkResult(size=total_safe_size,
                        mem=mem,
                        cpu=cpu)

    return(r.as_dict())


def hi_c_processing_bam(input_json):
    assert 'input_size_in_bytes' in input_json
    in_size = input_json.get('input_size_in_bytes')
    assert 'input_bams' in input_json.get('input_size_in_bytes')
    assert 'chromsize' in input_json.get('input_size_in_bytes')
    assert isinstance(in_size['input_bams'], list)

    # cpu
    nthreads_parse_sort = 8  # default from cwl
    nthreads_merge = 8  # default from cwl
    if 'parameters' in input_json:
        if 'nthreads_parse_sort' in input_json.get('parameters'):
            nthreads_parse_sort = input_json.get('parameters').get('nthreads_parse_sort')
        if 'nthreads_merge' in input_json.get('parameters'):
            nthreads_merge = input_json.get('parameters').get('nthreads_merge')

    # nthreads is the maximum of the two nthread parameters
    nthreads = nthreads_parse_sort if nthreads_parse_sort > nthreads_merge else nthreads_merge

    bamsize = B2GB(sum(in_size['input_bams']))
    other_inputsize = B2GB(in_size.get('chromsize'))
    pairsize = bamsize / 2  ## rough number
    outsize = bamsize + pairsize
    tmp_pairsamsize = bamsize * 5
    total_size = (bamsize + other_inputsize + outsize) *2 + tmp_pairsamsize  # input and output are copied once
    safe_total_size = total_size * 2
    mem = 2000  # very rough number

    r = BenchmarkResult(size=safe_total_size, mem=mem, cpu=nthreads)

    return(r.as_dict())


def hi_c_processing_pairs(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'input_pairs' in input_json.get('input_size_in_bytes')
    in_size = input_json['input_size_in_bytes']
    assert isinstance(in_size['input_pairs'], list)

    # cpu
    nthreads = 8  # default from cwl
    if 'parameters' in input_json:
        if 'nthreads' in input_json.get('parameters'):
            nthreads = input_json.get('parameters').get('nthreads')

    # space
    input_size = B2GB(sum(in_size['input_pairs']))
    out_size = input_size * 1.5 
    intermediate_size = input_size * 10
    total_size = input_size + out_size + intermediate_size
    total_safe_size = total_size * 1.4

    # mem
    maxmem = GB2MB(14)  # default from cwl
    if 'parameters' in input_json:
        if 'maxmem' in input_json.get('parameters'):
            maxmem = input_json.get('parameters').get('maxmem')
            if 'g' in maxmem:
                maxmem = GB2MB(int(maxmem.replace('g', '')))
            elif 'm' in maxmem:
                maxmem = int(maxmem.replace('m', ''))
            else:
                raise Exception("proper maxmem string?")

    cooler_mem = GB2MB(nthreads * input_size)
    if cooler_mem > maxmem:
        mem = cooler_mem
    else:
        mem = maxmem

    r = BenchmarkResult(size=total_safe_size, mem=mem, cpu=nthreads)
    return(r.as_dict())


def repliseq_parta(input_json):
    assert 'input_size_in_bytes' in input_json
    assert 'fastq' in input_json.get('input_size_in_bytes')
    assert 'bwaIndex' in input_json.get('input_size_in_bytes')

    # cpu
    nthreads = 4  # default from cwl
    if 'parameters' in input_json:
        if 'nthreads' in input_json.get('parameters'):
            nthreads = input_json.get('parameters').get('nthreads')

    # space
    input_sizes = input_json.get('input_size_in_bytes')
    data_input_size = input_sizes.get('fastq')
    total_input_size = data_input_size + input_sizes.get('bwaIndex')
    output_bam_size = data_input_size * 2
    output_clipped_fq_size = data_input_size
    output_size = output_bam_size * 3 + output_clipped_fq_size
    intermediate_index_size = input_sizes.get('bwaIndex') * 2
    copied_input_size = data_input_size * 7  # copied and unzipped
    total_intermediate_size \
        = intermediate_index_size + output_size + copied_input_size
    total_output_size = output_size
    additional_size_in_gb = 10

    total_file_size_in_bp \
        = total_input_size + total_intermediate_size + total_output_size
    total_size = B2GB(total_file_size_in_bp) + additional_size_in_gb

    # mem
    mem = B2MB(input_sizes.get('bwaIndex') * 4) + (nthreads * 500)

    r = BenchmarkResult(size=total_size, mem=mem, cpu=nthreads)

    return(r.as_dict())
