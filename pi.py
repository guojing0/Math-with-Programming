#!/usr/bin/env python

"""
The program is to compute the approximate value of Pi using Monte Carlo method.

Author: Jing Guo
Email: dev.guoj@gmail.com
Blog: guoj.org
"""

from math import pi, pow, sqrt
from random import uniform

__all__ ['Pi', 'estimate', 'info']

class Pi:

    def __init__(self):
        self.score = 0
        self.times = 0

        self.approx_pi = 0
        self.error_rate = 0

    def distance(self, x, y):
        dist = sqrt(pow(x, 2) + pow(y, 2))
        return dist

    def estimate(self):
        self.times += 1
        self.coordinate_x = uniform(-0.5, 0.5)
        self.coordinate_y = uniform(-0.5, 0.5)

        if Pi.distance(self, self.coordinate_x, self.coordinate_y) <= 0.5:
            self.score += 1

    def info(self):
        self.approx_pi = 4.0 * self.score / self.times
        self.error_rate = abs(self.approx_pi - pi) / pi

        print 'Score: %d' % self.score
        print 'Times: %d' % self.times
        print 'Approximate Pi: %f' % self.approx_pi
        print 'Error rate: %.5f%%' % (self.error_rate * 100)
