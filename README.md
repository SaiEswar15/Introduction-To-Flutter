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
9. still we may have errors because Stateless widget needs a key which kept coming from different classes by extending so we have to pass the key from our Class.


        class MyApp extends StatelessWidget
        {
            MyApp({super.key});

            @override
            Widget.build(BuildContext context)
            {
                return const Text("eswar", textDirection : TextDirection.ltr)
            }
        }
10. don't forget to override.

### Breaking the code into modules/ components

as we know already we have the MyApp in which we have the Hello World program and this will be our main class. now we break this into different modules 

```dart
import 'package: flutter/material.dart';
import 'package:helloworld/currency_converter.dart';

void main() {
  runApp(const MyApp()); //const is a compile time mutable
}

class MyApp extends StatelessWidget {
  

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConverter()
    );
  }
}
```

```dart
import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget{

  const CurrencyConverter({super.key});

  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
        body: Center(
          child: Text("hello world"),
        ),
      );
  }
}
```
Now we go forward to design the interface

# Printing in Flutter

if you try to print anything in Flutter Project it will give you an error

example :

```dart
onPressed: () {
	print("hello");
}
```

this is because any important data can be printed using this print() function so Flutter doesn’t allow printing.

but you can do this by removing the `lint` provided by Flutter in your `analysis_options.yaml` file.

```yaml
include: package:flutter_lints/flutter.yaml

linter:
  # The lint rules applied to this project can be customized in the
  # section below to disable rules from the `package:flutter_lints/flutter.yaml`
  # included above or to enable additional rules. A list of all available lints
  # and their documentation is published at https://dart.dev/lints.
  #
  # Instead of disabling a lint rule for the entire project in the
  # section below, it can also be suppressed for a single line of code
  # or a specific dart file by using the `// ignore: name_of_lint` and
  # `// ignore_for_file: name_of_lint` syntax on the line or in the file
  # producing the lint.
  rules:
    # avoid_print: false  # Uncomment to disable the `avoid_print` rule
    # prefer_single_quotes: true  # Uncomment to enable the `prefer_single_quotes` rule

# Additional information about this file can be found at
# https://dart.dev/guides/language/analysis-options
```

you can uncomment the avoid_print: false and then you can start printing but I would not recommend it.

you can print it using `debugPrint`

```dart
onPressed: () {
	debugPrint("hello");
},
```

The other way is using the if condition and the debug mode.

# Button

There are several types of buttons in Flutter's material.dart including:

1. `FlatButton`: A text label displayed on a (zero elevation) `Material` widget. The button reacts to touches by filling with color.
2. `RaisedButton`: A Material Design raised button. It contains ink splashes for a "pressed" state.

For button we can get :

- <ButtonStyle> style = ButtonStyle.
    
    with this make designs for the button.
    
    for all these constants inside the ButtonStyle use `MaterialStyleProperty` but since it is an abstract class we will use something that extends this `MaterialStyleProperty` which is nothing but `MaterialStatePropertyAll()`
    

```dart
style: const ButtonStyle(
  backgroundColor: MaterialStatePropertyAll(Colors.black),
  foregroundColor: MaterialStatePropertyAll(Colors.white),
  minimumSize: MaterialStatePropertyAll(
    Size(double.infinity, 50),
  ),
  elevation: MaterialStatePropertyAll(10.0),
  shape: MaterialStatePropertyAll(
    ContinuousRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(10),
        right: Radius.circular(10),
      ),
    ),
  ),
),
```

but writing this `MaterialStatePropertyAll` is time taking so there is a method which `ButtonStyle` gives us which is :