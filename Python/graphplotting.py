import numpy as np
import matplotlib.pyplot as plt
'''
ypoints = np.array([3, 5, 7, 2, 4, 1, 9])
xpoints = np.array([2000, 2001, 2002, 2003, 2004, 2005, 2006])
plt.plot(xpoints, ypoints, marker = 'o', ls = 'dotted', color = 'g')
plt.title("Revenue over the years")
plt.ylabel("Revenue (In Billions $)")
plt.xlabel("Years")
plt.grid()
plt.show()
'''

x = np.array(["John", "Peter", "Bas", "Lober", "Schmeichel"])
y = np.array([10, 20, 45, 35, 15])
plt.xlabel("Sales Rep")
plt.ylabel("Sales (in $1000s)")
plt.bar(x,y)
plt.grid()
plt.show()
