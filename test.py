import pi

x = pi.Pi()

for i in range(100000):
    x.compute()

x.info()