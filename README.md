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

**creating our custom widget**
we cannot write all our widgets inside the single runApp() class constructor which will be not feasible or looks good.
we want multiple members to work on particular widget it will be difficult if written in a single class.

so we create widgets seperately 

1. create a class with a name of your choice 
2. there are different types of widgets stateless Widgets and stateful widget.
3. displaying a text is a stateless widget so we extend our class to the stateless widget.
4. and we have to know that stateless widget is a abstract class so we have to override certain required abstract functions.
5. in this case Widget.build() which takes the parameter as context which has a return type of BuildContext which is nothing but our Text Widget and don't forget the const
6. 
        class MyApp extends StatelessWidget
        {
            Widget.build(BuildContext context)
            {
                return const Text("eswar", textDirection : TextDirection.ltr)
            }
        }
7. now pass your widget to the runApp(). since myApp is also a class we have to instantiate with constructor and the class is compile time runnable so we can use const.
        void main()
        {
            runApp(const MyApp());
        }
8. now we have our custom built widget called MyApp.