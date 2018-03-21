import os
import csv
import re
from Benchmark.byteformat import *


class BenchmarkResult(object):
    def __init__(self, size, mem, cpu):
        self.total_size_in_GB = size
        self.total_mem_in_MB = mem
        self.min_CPU = cpu
        self.aws = get_optimal_instance_type(cpu=cpu, mem_in_gb=MB2GB(mem))

    def as_dict(self):
        return rdict(self)


class OptimalInstance(object):
    def __init__(self, cost_in_usd, mem_in_gb=None, cpu=None,
                 recommended_instance_type=None, EBS_optimized=None,
                 EBS_optimization_surcharge=None):
        self.cost_in_usd = cost_in_usd
        self.mem_in_gb = mem_in_gb
        self.cpu = cpu
        self.recommended_instance_type = recommended_instance_type
        self.EBS_optimized = EBS_optimized
        self.EBS_optimization_surcharge = EBS_optimization_surcharge

    def reset(self, cost_in_usd=None, mem_in_gb=None, cpu=None,
              recommended_instance_type=None, EBS_optimized=None,
              EBS_optimization_surcharge=None):
        if cost_in_usd:
            self.cost_in_usd = cost_in_usd
        if mem_in_gb:
            self.mem_in_gb = mem_in_gb
        if cpu:
            self.cpu = cpu
        if recommended_instance_type:
            self.recommended_instance_type = recommended_instance_type
        if EBS_optimized:
            self.EBS_optimized = EBS_optimized
        if EBS_optimization_surcharge:
            self.EBS_optimization_surcharge = EBS_optimization_surcharge

    def as_dict(self):
        return rdict(self)


def rdict(x):
    """
    recursive conversion to dictionary
    converts objects in list members to dictionary recursively
    """
    if isinstance(x, list):
        l = [rdict(_) for _ in x]
        return l
    elif isinstance(x, dict):
        x2={}
        for k, v in x.items():
            x2[k] = rdict(v)
        return x2
    else:
        if hasattr(x, '__dict__'):
            d = x.__dict__
            toremove=[]
            for k, v in d.items():
                if v is None:
                    toremove.append(k)
                else:
                    d[k] = rdict(v)
            for k in toremove:
                del(d[k])
            return d
        else:
            return x


def get_aws_ec2_info_file():
    this_dir, _ = os.path.split(__file__)
    return(os.path.join(this_dir, "aws", "Amazon EC2 Instance Comparison.csv"))


def get_optimal_instance_type(cpu=1, mem_in_gb=0.5,
                              instance_info_file=get_aws_ec2_info_file()):
    res = OptimalInstance(100000)
    with open(instance_info_file, "r") as csvfile:
        spamreader = csv.DictReader(csvfile, delimiter=',', quotechar='"')
        for row in spamreader:
            row_cpu = int(re.sub(" vCPUs.*", '', row['vCPUs']))
            row_instance_type = row['API Name']
            row_mem = float(row['Memory'].replace(' GiB', ''))
            row_cost_str = row['Linux On Demand cost']
            row_cost = float(row_cost_str.replace(' hourly', '')
                                         .replace('$', ''))
            row_ebs_opt_surcharge = row['EBS Optimized surcharge']
            if row_ebs_opt_surcharge == 'unavailable':
                row_ebs_opt = False
                row_ebs_opt_surcharge = None
            else:
                row_ebs_opt = True
                row_ebs_opt_surcharge \
                    = float(row_ebs_opt_surcharge.replace(' hourly', '')
                                                 .replace('$', ''))
            if row_cpu >= cpu and row_mem >= mem_in_gb:
                if row_cost < res.cost_in_usd:
                    res.reset(row_cost, row_mem, row_cpu, row_instance_type,
                              row_ebs_opt, row_ebs_opt_surcharge)
    if res.cost_in_usd == 100000:
        raise NoMatchingInstanceException

    return(res.as_dict())


# Exceptions
class NoMatchingInstanceException(Exception):
    def __init__(self, value=None):
        if not value:
            self.value = "No EC2 instance can match the requirement."

