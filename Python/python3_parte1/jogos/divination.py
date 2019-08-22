from builtins import int, input

print("***************************")
print("Welcome to divinations game")
print("***************************")

secret_number = 42

guess_number = int(input("Type your number: \n"))

print("You typed: ", guess_number)

got_it_right = guess_number == secret_number
bigger = guess_number > secret_number

if got_it_right:
    print("You got it right")
elif bigger:
    print("You got it wrong! Your guess is bigger than secret number")
else:
    print("You got it wrong! Your guess is smaller than secret number")

input("")
