#1 
A = [[ 3   5]
     [7   -5]]

X = [[x]
     [y]]

B = [[6]
     [9]]

# find the values in the matrix X , to find the value of x and y variables in Equation 1
X = inverse(A).B

# Solving a System of Linear Equations with Numpy
# to solve a system of linear equations, we need to perform two operations: matrix inversion and a matrix dot product
$ pip install numpy

import numpy as np

m_list = [[3, 5], [7, -5]]
A = np.array(m_list)

#To find the inverse of a matrix, the matrix is passed to the linalg.inv() method of the Numpy module:

inv_A = np.linalg.inv(A)

print(inv_A)

#  find the dot product with the Numpy library:
B = np.array([6, 9])
X = np.linalg.inv(A).dot(B)

print(X)

#--------------------------
# 2
A = np.array([[1,1,1], [0, 1,1], [2, 5, -1]])
B = np.array([6, -4, 27])
X = np.linalg.inv(A).dot(B)

print(X)

A = np.array([[1,1,1], [0, 1,1], [2, 5, -1]])
B = np.array([6, -4, 27])
X2 = np.linalg.solve(A,B)

print(X2)

#--------------------------
#3 
A = [[ 1   1]
     [2   2]]

X = [[x]
     [y]]

B = [[4]
     [8]]

# find the values in the matrix X , to find the value of x and y variables in Equation 1
X = inverse(A).B

# Solving a System of Linear Equations with Numpy
# to solve a system of linear equations, we need to perform two operations: matrix inversion and a matrix dot product
$ pip install numpy

import numpy as np

m_list = [[1, 1], [2, 2]]
A = np.array(m_list)

#To find the inverse of a matrix, the matrix is passed to the linalg.inv() method of the Numpy module:

inv_A = np.linalg.inv(A)

print(inv_A)

#  find the dot product with the Numpy library:
B = np.array([4, 8])
X = np.linalg.inv(A).dot(B)

print(X)
