import hangman
import divination

print("*********************************")
print("*******Choose your game!*******")
print("*********************************")

print("(1) Hangman  (2) Divination")

jogo = int(input("Which game? "))

if (jogo == 1):
    print("Playing Hangman Game")
    hangman.play()
elif (jogo == 2):
    print("Playing Divination Game")
    divination.play()