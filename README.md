# GF ZPSKTR by AnriTool{RU}
"Запускатор" Greenfoot игр, сохранённых в jar формате.

## Принцип работы
Скрипт на питоне смотрит какие игры есть в папке "games" и показывает их в интерфейсе. При нажатии на "Start" создаётся .bat файл с нужными параметрами и он же запускается.

## Важно
* В папке jdk должен находится соответсвенно сам jdk(я брал всю папку прямиком из Standalone версии greenfoot)
* В папке lib должен находится javafx(его я тоже брал с Standalone версии greenfoot)
* В папке "games" должна быть хотябы одна игра в .jar формате(и только в нём, больше ничего в этой папке быть не должно)
* Чтобы у игры было изображение, нужно чтобы название картинки соотвествовало названию игры, и картинка находилась в папке "images" 
* Рекомендованное разрешение изображения: 178x130. Все другие размеры будут принудительно изменены до нужного.

## Сборка
Сборка делалась мною через nuitka.
Требуется: 
* Python
* nuitka 
* MinGw64(nuitka предложит сама всё скачать и поставить при первой компиляции)
* библиотека pillow
* библиотека tk-inter
Код для сборки:

< python -m nuitka --standalone --enable-plugin=tk-inter --windows-icon-from-ico=icon.ico --windows-disable-console --mingw64 main.py >

После сборки в папку PIL нужно поместить соответсвенно библиотеку PIL(Я скопировал всю папку PIL из директории Python)

# GF ZPSKTR by AnriTool{EN}
Launcher of Greenfoot games saved in jar format.

## Working principle
The python script looks at which games are in the "games" folder and shows them in the interface. When you click on "Start" it is created.a bat file with the necessary parameters and it also runs.

## Important
* The jdk folder should contain the jdk itself accordingly (I took the entire folder straight from the Standalone version of greenfoot)
* javafx should be located in the lib folder (I also took it from the Standalone version of greenfoot)
* There should be at least one game in the "games" folder.jar format (and only in it, nothing else should be in this folder)
* In order for the game to have an image, it is necessary that the name of the picture corresponds to the name of the game, and the picture is in the "images" folder
* Recommended image resolution: 178x130. All other sizes will be forcibly changed to the desired size.

## Assembly
The assembly was done by me through nuitka.
Is required:
* Python
* nuitka
* MinGw64 (nuitka will offer to download and install everything herself at the first compilation)
* pillow library
* tk-inter library
Code for the build:

< python -m nuitka --standalone --enable-plugin=tk-inter --windows-icon-from-ico=icon.ico --windows-disable-console --mingw64 main.py >

After the build, the PIL library should be placed in the BIN folder, respectively.(I copied the entire PIL folder from the Python directory)
