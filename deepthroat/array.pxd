#-*- coding: utf-8-*-
#cython: language_level=3
#cython: boundscheck=False
#cython: wraparound=False
#cython: embedsignature=True
#cython: cdivision=True
cimport math
cimport fcmp

cdef inline double fmax(double[:] arr) nogil:
    cdef:
        double r = -1.7976931348623157e+308
        int i
    for i in range(arr.shape[0]):
        if math.is_nan(arr[i]):
            continue
        if arr[i] > r:
            r = arr[i]
    return r

cdef inline double fargmax(double[:] arr) nogil:
    cdef:
        double r = -1.7976931348623157e+308
        int i, x
    for i in range(arr.shape[0]):
        if math.is_nan(arr[i]):
            continue
        if arr[i] > r:
            r = arr[i]
            x = i
    return x

cdef inline long imax(long[:] arr) nogil:
    cdef:
        long r = -9223372036854775807
        int i
    for i in range(arr.shape[0]):
        if arr[i] > r:
            r = arr[i]
    return r

cdef inline long iargmax(long[:] arr) nogil:
    cdef:
        long r = -9223372036854775807
        int i, x
    for i in range(arr.shape[0]):
        if arr[i] > r:
            r = arr[i]
            x = i
    return x

cdef inline double fmin(double[:] arr) nogil:
    cdef:
        double r = 1.7976931348623157e+308
        int i
    for i in range(arr.shape[0]):
        if math.is_nan(arr[i]):
            continue
        if arr[i] < r:
            r = arr[i]
    return r

cdef inline double fargmin(double[:] arr) nogil:
    cdef:
        double r = 1.7976931348623157e+308
        int i, x
    for i in range(arr.shape[0]):
        if arr[i] < r:
            continue
        if arr[i] < r:
            r = arr[i]
            x = i
    return x

cdef inline long imin(long[:] arr) nogil:
    cdef:
        long r = 9223372036854775807
        int i
    for i in range(arr.shape[0]):
        if arr[i] > r:
            r = arr[i]
    return r

cdef inline long iargmin(long[:] arr) nogil:
    cdef:
        long r = 9223372036854775807
        int i, x
    for i in range(arr.shape[0]):
        if arr[i] > r:
            r = arr[i]
            x = i
    return x

cdef inline double fsum(double[:] arr) nogil:
    cdef:
        double r
        int i
    for i in range(arr.shape[0]):
        if math.is_nan(arr[i]):
            continue
        r += arr[i]
    return r

cdef inline long isum(long[:] arr) nogil:
    cdef:
        long r
        int i
    for i in range(arr.shape[0]):
        r += arr[i]
    return r

cdef inline double fnancount(double[:] arr) nogil:
    cdef:
        long r = 0
        int i
    for i in range(arr.shape[0]):
        if math.is_nan(arr[i]):
            continue
        r += 1
    return r

cdef inline int any(int[:] arr) nogil:
    cdef:
        int i
    for i in range(arr.shape[0]):
        if arr[i] != 0:
            return True
    return False

cdef inline int all(int[:] arr) nogil:
    cdef:
        int i
    for i in range(arr.shape[0]):
        if arr[i] == 0:
            return False
    return True

# cdef inline double fmean(double[:] arr) nogil:
#     return fsum(arr) / fnancount(arr)

# cdef inline double imean(arr) nogil:
#     return isum(arr) / arr.shape[0]
