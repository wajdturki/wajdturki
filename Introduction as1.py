
# 1 Biggie Size  
def biggie_size(array):
    for i in range(len(arr,ay)):
        if array[i]>0:
            array[i]='big'
    return array
print(biggie_size([0,-5,-6,8,9,10]))


# 2 Count Positives  
def count_positives(array):
    count = 0
    for val in array:
        if val > 0:
            count += 1
    array[len(array)-1] = count
    return array
print([-5,-9,0,32,-6,22])
print(count_positives([-5,-9,0,32,-6,22]))


# 3 Sum Total  
def sum_total(array):
    sum = 0
    for val in array:
        sum += val
    return sum
print(sum_total([1,1,1,1]))
print(sum_total([1,1,1,55]))


# 4 Average  
def avg(list):
    sum = 0
    for val in list:
        sum += val
    return (sum/len(list))
print(avg([5,5,5,6]))


# 5 Length  
def lengthFun(array):
    return len(array)
print(lengthFun([1,1,1,1,1,4]))
print(lengthFun([1,1]))


# 6 Minimum 
def minFun(array):
    if len(array)<0:
        return False
    minInt = array[0]
    for val in array:
        if val<minInt:
            minInt = val
    return minInt
print(minFun([600,80,99,26,3,5]))


# 8 Ultimate Analysis  
def ultimate_analysis(array):
    myDictonary = {'sumTotal': 0, 'average': 0, 'minimum': array[0], 'maximun': array[0], 'length': len(array)}
    for val in array:
        if myDictonary['minimum']<val:
            myDictonary['minimum'] = val
        if myDictonary['maximun']>val:
            myDictonary['maximun'] = val
        myDictonary['sumTotal']+= val
        myDictonary['average']=myDictonary['sumTotal']/len(array)
    return myDictonary
print(ultimate_analysis([1,2,1,2,4,0]))
print(ultimate_analysis([1,0]))
print(ultimate_analysis([15,4,1,0]))


# 9 Reverse List - 
def reverse_list(array):
    for i in range(0, (len(array)-1)//2):
        temp = array[i]
        array[i] = array[len(array)-1-i]
        array[len(array)-1-i] = temp
    return array
print(reverse_list([11,12,13]))
print(reverse_list([11,12,13,14,15,16]))
print(reverse_list([11,12,13,14,15,16,18]))
