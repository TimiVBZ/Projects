print('hello')

amount = float(input('Please, enter an amount: '))
cents = amount*100

dollars = cents // 100
cents = cents % 100
quarters = cents // 25
cents = cents % 25
dimes = cents // 10
cents = cents % 10
nickels = cents // 5
pennies = cents % 5

print('Your amount consists of: ')

if dollars > 1:
    print(int(dollars), 'Dollars')
elif dollars == 1:
    print('1 Dollar')
else:
    print('0 Dollar')

if quarters > 1:
    print(int(quarters), 'Quarters')
elif quarters == 1:
    print('1 Quarter')
else:
    print('0 Quarter')

if dimes > 1:
    print(int(dimes), 'Dimes')
elif dimes == 1:
    print('1 Dime')
else:
    print('0 Dime')

if nickels > 1:
    print(int(nickels), 'Nickels')
elif nickels == 1:
    print('1 Nickel')
else:
    print('0 nickel')

if pennies > 1:
    print(int(pennies), 'Pennies')
elif pennies == 1:
    print('1 Penny')
else:
    print('0 Penny')
    
