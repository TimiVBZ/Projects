import random

def menu(num1, num2):
    
    while user == "Y":
        option = input("Pick an option (A for adding, B for subtracting, C for multiplicating, 4 for exit): ")
        while option != "D":
            
            if option == "A":
                value1 = num1 + num2
                return value1
                print('Added number')
            elif option == "B":
                value2 = num1 - num2
                return value2
                print('Subtracted numbers')
            elif option == "C":
                value3 = num1 * num2
                return value3
                print('Multiplied numbers')
            elif option ==  "D":
                print("Exitting...")
                break
            else:
                print("Invalid option. Pick between 1 - 4: ")
                


user = input("Would you like to start? (Y or N): ")
if user == "Y":
    print(menu(5, 6))
elif user == "N":
    print("Good bye")


        
