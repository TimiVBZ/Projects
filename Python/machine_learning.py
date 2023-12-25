import numpy



#ages = [5,23,34,55,67,89,12,34,32,56,7,88,5,1,23,44,56,73]

numlist = input("Enter the numbers: ")
user_list = numlist.split()

for i in range(len(user_list)):
    user_list[i] = float(user_list[i])
    
print("Here are your number", user_list)

ans = int(input("What would you like to do with these numbers: \n1-Average\n2-Standard Deviation\n3-Sum\n4-25th percentile\n5-50th percentile\n6-75th percentile\n7-Max\n8-Min\n9-Variance\n:"))

print("\n")
if ans == 1:
    print("Average = ", numpy.mean(user_list))
elif ans == 2:
    print("Stardard Deviation = ", round(numpy.std(user_list),2))
elif ans == 3:
    print("Sum = ", numpy.sum(user_list))
elif ans == 4:
    print("25th percentile = ", round(numpy.percentile(user_list,25),2))
elif ans == 5:
    print("50th percentile = ", round(numpy.percentile(user_list,50),2))
elif ans == 6:
    print("75th percentile = ", round(numpy.percentile(user_list,75),2))
elif ans == 7:
    print("Max = ", numpy.max(user_list))
elif ans == 8:
    print("Min = ", numpy.min(user_list))
elif ans == 9:
    print("Variance = ", round(numpy.var(user_list),3))
else:
    print("Incorrect option")

'''
x = numpy.percentile(user_list,25)
y = numpy.percentile(user_list,50)
z = numpy.percentile(user_list,75)
a = numpy.mean(user_list)
c = numpy.median(user_list)

print(user_list)

print("The 25th percentile is: ", x)
print("The 50th percentile is: ", y)
print("The 75th percentile is: ", z)
print("Mean = ", a)
print("Median = ", c)




power = int(input("Turn on menu? "))
while power < 1:
    print("Menu is off. Bye!")
    break
else:
    ele = input("Please enter the numbers (Separate numbers by space): \n")
    list1 = ele.split()
    print("List: ", list1)
    for i in range(len(list1)):
        list1[i] = int(list1[i])
    print("\n")
    ans = int(input("What would you like to do with these numbers: \n1-Min\n2-Max\n3-Sum\n:"))
    print("\n")
    if ans == 1:
        print("Min = ", min(list1))
    elif ans == 2:
        print("Max = ", max(list1))
    elif ans == 3:
        print("Sum = ", sum(list1))
    else:
        print("Incorrect option")
    ele = input("Please enter the numbers: \n")
'''
    

      



