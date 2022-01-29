#-*- coding: utf-8-*-
#cython: language_level=3
#cython: boundscheck=False
#cython: wraparound=False
#cython: embedsignature=True
#cython: cdivision=True

cdef inline double NAN() nogil:
    return 0.0 / 0.0

cdef inline double PINF() nogil:
    return +1.0 / 0.0

cdef inline double NINF() nogil:
    return -1.0 / 0.0

cdef inline int is_nan(double x) nogil:
    return x == NAN()

cdef inline int is_pinf(double x) nogil:
    return x == PINF()

cdef inline int is_ninf(double x) nogil:
    return x == NINF()

cdef inline double fmax(double x, double y) nogil:
    return x if x > y else y

cdef inline double fmin(double x, double y) nogil:
    return x if x < y else y

cdef inline double fabs(double x) nogil:
    return x if x > 0 else -x

cdef inline long imax(long x, long y) nogil:
    return x if x > y else y

cdef inline long imin(long x, long y) nogil:
    return x if x < y else y

cdef inline long iabs(long x) nogil:
    return x if x > 0 else -x

cdef inline double floor(double x) nogil:
    return <int> x

cdef inline double ceil(double x) nogil:
    return <int> x + 1.0

cdef inline double round(double x) nogil:
    return <int> x + 0.5

cdef inline double roundp(double x, int precise) nogil:
    return round(x * 10 ** precise) / 10 ** precise
