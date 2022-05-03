from tkinter import *
import os
from PIL import Image, ImageTk

def previous():
    global current
    global img
    global image
    global canvas
    global photo
    global text
    global frame
    files = os.listdir(path="GAMES")
    if current < 1:
        current = len(files)-1
        print(current)

    else:
        current = current - 1
        print(current)

    img = files[0].partition(".jar")[current] + ".png"
    if os.path.exists("IMAGES/" + img):
        image = Image.open("IMAGES/" + img)
        pass
    else:
        image = Image.open("IMAGES/NOIMAGE.png")
    image = image.resize((178, 130))
    photo = ImageTk.PhotoImage(image)
    text.config(text=files[current])
    image = canvas.create_image(0, 0, anchor='nw', image=photo)
    canvas.grid(row=1, column=2)
    frame.pack(expand=True)
    setGame(files)
    pass

def next():
    global current
    global img
    global image
    global canvas
    global photo
    global text
    global frame
    files = os.listdir(path="GAMES")
    if current == len(files)-1:
        current = 0
        print(current)

    else:
        current = current + 1
        print(current)

    img = files[0].partition(".jar")[current] + ".png"
    if os.path.exists("IMAGES/" + img):
        image = Image.open("IMAGES/" + img)
        pass
    else:
        image = Image.open("IMAGES/NOIMAGE.png")
    image = image.resize((178, 130))
    photo = ImageTk.PhotoImage(image)
    text.config(text=files[current])
    image = canvas.create_image(0, 0, anchor='nw', image=photo)
    canvas.grid(row=1, column=2)

    frame.pack(expand=True)
    setGame(files)
    pass

def setGame(files):
    print(files[current])
    return files[current]

def startGame():
    str = "jdk\\bin\\java.exe -cp \"lib\\javafx\\lib\\javafx.base.jar;lib\\javafx\\lib\\javafx.controls.jarlib\\javafx\lib\\javafx.fxml.jar;lib\\javafx\\lib\javafx.media.jar;lib\\javafx\\lib\\javafx.properties.jar;lib\\javafx\\lib\\javafx.swing.jar;lib\\javafx\\lib\\javafx.web.jar;"
    str = str + "GAMES\\" + files[current] + "\" --module-path \"lib\javafx\lib\" --add-modules=ALL-MODULE-PATH greenfoot.export.GreenfootScenarioApplication"
    bat = open("start.bat", 'w')
    bat.write(str);
    print(str)
    bat.close()
    os.startfile("start.bat")
    #os.system(str)


    ## MicroFantasy.jar\" --module-path "lib\javafx\lib" --add-modules=ALL-MODULE-PATH greenfoot.export.GreenfootScenarioApplication)
    pass

root = Tk()
root.title("GF ZPSKTR By AnriTool")
root.geometry("310x190")
root.resizable(width=False, height=False)

frame = Frame(root)

current = 0
butLeft = Button(frame, text="Previous", width = 7, command=previous).grid(row=1, column=1)
butRight = Button(frame, text="Next", width = 7, command=next).grid(row=1, column=3)
text = Label(frame, width=24, height=1)
##text = Text(frame, width=18, height=2)
text.grid(row=2, column=2)
butStart = Button(frame, text="Start", width = 7, command=startGame).grid(row=3, column=2)

files = os.listdir(path="GAMES")
text.config(text=files[0])
##text.insert(1.0, files[0])
img = files[0].partition(".jar")[0]+".png"
if os.path.exists("IMAGES/"+img):
    image = Image.open("IMAGES/" + img)
    pass
else:
    image = Image.open("IMAGES/NOIMAGE.png")
image = image.resize((178, 130))
canvas = Canvas(frame, height=image.height, width=image.width)
photo = ImageTk.PhotoImage(image)
image = canvas.create_image(0, 0, anchor='nw',image=photo)
canvas.grid(row=1, column=2)

frame.grid(columnspan=5, rowspan=4, padx=(3,0),pady=(3,0))
frame.pack(expand = True)


files = os.listdir(path="GAMES")

root.mainloop()


