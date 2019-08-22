import random

def play():
    print("***************************")
    print("Welcome to divinations game")
    print("***************************\n")

    secret_number = random.randrange(1, 101)
    print (f"The secret number is {secret_number}")
    total_score = 1000

    print ("Whats is the level of difficult?\n(1) Easy    (2) Medium   (3) Hard\n")
    level = int(input("Enter level: "))

    if level == 1:
        total_retries = 20
    elif level == 2 :
        total_retries = 10
    else:
        total_retries = 5

    for round in range(1, total_retries + 1):
        print("Retrie {} of {}".format(round, total_retries))

        guess_number = int(input("Enter a number from 1 to 100: \n"))
        print("You typed: ", guess_number)

        if guess_number < 1 or guess_number > 100:
            print ("You must enter a number from 1 to 100!!!")
            continue

        got_it_right = guess_number == secret_number
        bigger = guess_number > secret_number

        if got_it_right:
            print(f"You got it right and your score is {total_score}")
            break
        elif bigger:
            print("You got it wrong! Your guess is bigger than secret number")
            total_score -= abs(guess_number - secret_number)
        else:
            print("You got it wrong! Your guess is smaller than secret number")
            total_score -= abs(guess_number - secret_number)

    input("The End!")

if (__name__ == "__main__"):
    play()