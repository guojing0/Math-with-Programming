#!/usr/bin/env python

"""
The program is to compute the approximate value of Pi using Monte Carlo method.

Author: Jing Guo
Email: dev.guoj@gmail.com
Blog: guoj.org
"""

from math import pow, sqrt
from random import uniform

class Pi:

    def __init__(self):
        self.score = 0
        self.times = 0        

    def distance(self, x, y):
        dist = sqrt(pow(x, 2) + pow(y, 2))
        return dist

    def compute(self):
        self.coordinate_x = uniform(-0.5, 0.5)
        self.coordinate_y = uniform(-0.5, 0.5)

        self.times += 1

        if Pi.distance(self, self.coordinate_x, self.coordinate_y) <= 0.5:
            self.score += 1

    def info(self):
        print 'Score: %d' % self.score
        print 'Times: %d' % self.times
        print 4.0 * self.score / self.times