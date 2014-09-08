import random

def expectation(min, max, times):
    """
    Calculate the expectation.

    E.g.
    The expectation of Bernoulli distribution:
    expectation(0, 1, times) ~= 0.5

    The expectation of throwing a dice for lots of times:
    expectation(1, 6, times) ~= 3.5
    """

    total = 0.0
    for x in xrange(times):
        total += random.randint(min, max)
    return total/times