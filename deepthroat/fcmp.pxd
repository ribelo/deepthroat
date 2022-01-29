#-*- coding: utf-8-*-
#cython: language_level=3
#cython: boundscheck=False
#cython: wraparound=False
#cython: embedsignature=True
#cython: cdivision=True
from libc.float cimport DBL_EPSILON as eps

cdef inline int eq(double x, double y) nogil:
    return x - y < eps and x - y > -eps

cdef inline int ne(double x, double y) nogil:
    return x - y > eps or x - y < -eps

cdef inline int gt(double x, double y) nogil:
    return x - y > eps

cdef inline int ge(double x, double y) nogil:
    return gt(x, y) or eq(x, y)

cdef inline int lt(double x, double y) nogil:
    return x - y < -eps

cdef inline int le(double x, double y) nogil:
    return lt(x, y) or eq(x, y)
