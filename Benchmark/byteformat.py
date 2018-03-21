GB_IN_BYTES = 1073741824
MB_IN_BYTES = 1048576
GB_IN_MB = 1024


def B2GB(x):
    return(x/GB_IN_BYTES)


def B2MB(x):
    return(x/MB_IN_BYTES)


def MB2GB(x):
    return(x/GB_IN_MB)


def GB2MB(x):
    return(x*GB_IN_MB)
