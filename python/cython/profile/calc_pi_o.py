#!/usr/bin/env python
# encoding: utf-8
# filename: calc_pi.py

def recip_square(i):
    return 1./i**2

def approx_pi(n=100000000L):
    val = 0.
    for k in range(1,n+1):
        val += recip_square(k)
    return (6 * val)**.5
