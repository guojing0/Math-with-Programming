#!/usr/bin/env python

"""
Calculate the expectation from min to max using Monte Carlo method.

Examples:

The expectation of the Bernoulli distribution: expectation(0, 1, times) ~= 0.5

The expectation of throwing a dice for times: expectation(1, 6, times) ~= 3.5
"""

from random import randint

def expectation(min, max, times):
    total = 0

    for x in xrange(times):
        total += randint(min, max)

    return 1.0 * total / times