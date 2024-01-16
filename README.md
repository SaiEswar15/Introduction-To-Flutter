## Creating a flutter app

**Creating our first widget**
1. inside the lib folder goes the main code
2. in lib folder there is the main.dart file which is the initial or starting point of the flutter project.
3. as we know there should be void main(){} function in order to start the project.
4. inside the main function we call the runApp() class which we get from the package:/flutter/material.dart
5. our runApp class is a class and in its constructor it accepts param as Widget. 
6. one of the widget we can get is the Text Widget
7. Text widget is class which accepts string as positional args
so we should pass a string.
8. but still it gives you an error because we should provide the named param which is enum which is TextDirection
9. TextDirection contains some values left to right and right to left.
10. it still complains because the Text class is a compile time executed so we can use const.
11. Now we have created a widget and displayed it on our screen.

