y = 3500 * 10
k0 = y/2

kn = k0

for i in range(11):
    kn = (kn + (y/kn) )/ 2 
    print(kn)