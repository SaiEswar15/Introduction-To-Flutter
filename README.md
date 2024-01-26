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

```dart
style: ElevatedButton.styleFrom(
  backgroundColor: Colors.black,
  foregroundColor: Colors.white,
  minimumSize: const Size(double.infinity, 50),
  elevation: 10.0,
  shape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(10),
        right: Radius.circular(10),
      ),
    ),
),
```
(or)

```dart
style: TextButton.styleFrom(
  backgroundColor: Colors.black,
  foregroundColor: Colors.white,
  minimumSize: const Size(double.infinity, 50),
  elevation: 10.0,
  shape: const ContinuousRectangleBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(10),
        right: Radius.circular(10),
      ),
    ),
),
```


# Fetching, try catch, Future building,

Now that we have completed created an ui using the stateless widget.

- **installing a package.**
    
    we have to get the data from the api.
    
    for which we will be using the http package.
    
    you can go to [pub.dev](http://pub.dev) and search for package (ex: http)
    
    and you have to just copy and paste in .yaml file.
    
- **create a function to fetch the data from api.**
    1. import the package.
    2. create a function inside the widget (not inside the build function because we want our build function to be as clean as possible because they will be called multiple times and also will be used or called in different places).
    3. if you want to keep changing the query of the uri destructure and store it inside the variables so that we can make it dynamic.
    4. the secret keys can be stored in separate files or you can add them to .env file so that they can be secure.
    
    ```dart
    final cityName = "London,uk";
      
      Future<dynamic> getWeatherData() async {
        
        final response = await http.get(Uri.parse("api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$weatherApiKey"));
        print(response.body);
    
      }
    ```
    
    1. **Calling the function but where exactly ?**
        
        Now that we have created a function it will not work unless you call the function but where should we call the function.
        
        we have build function which we should avoid async functions.
        
        we need a special feature which we should before the build function which will happen when we use the initState() function but the problem is init state is present inside the class which extends the stateful widget.
        
        so convert the stateless to stateful widget.
        
        either you can write the whole or use simple simple ctrl+shift+R and click convert which will take care and then create a initState()
        
    2. **convert to JSON data :**
        
        Now we have configured the fetch function you will get the output but remember that you will get the data in the string format so you have to configure again to convert it to json.
        
        import the dart:convert package
        
        ```dart
        import "dart:convert";
        ```
        
        ```dart
        Future<dynamic> getWeatherData() async {
        
            final response = await http.get(Uri.parse(
                "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=8804292f320285f22a0cc2538cfd625a"
              )
            );
            final data = await jsonDecode(response.body);
            
            print(data["coord"]["lon"]);
        
          }
        ```
        
        if you know what the output will be most of the time Map so we can give the return type as Map with its type again consists of String and dynamic because the keys are dynamic
        
        ```dart
        Future<Map<String,dynamic>> getWeatherData() async {
        
            final response = await http.get(Uri.parse(
                "https://api.openweathermap.org/data/2.5/weather?q=London,uk&APPID=8804292f320285f22a0cc2538cfd625a"
              )
            );
            final data = await jsonDecode(response.body);
            
            print(data["coord"]["lon"]);
        
          }
        ```
        
    
    1. **Try-Catch block :**
        
        now that we are getting the data it is fine but it doesn’t mean that you will be getting data every time so it is better to put a try-catch block.
        

- **Retrieving the data we need from the api :**
- **assigning the data to variables with initial values :**
    
    should be use the variables as final, const or late
    
    if we assign late then it will ignore the data which comes late. so late is not the perfect to assign.
    
    we cannot use final because they keep changing with the api call.
    
    if we know the datatype it is going to have better go with that.
    
    as we know stateless widget we can create new variables and are also mutable.
    
- **Assigning the variables** : to where ever they are required.
    
    we will fill the values in the build function
    
- **Problem :**
    
    now that we had the variables which are also getting the data 
    
    assigned where ever required 
    
    now if we refresh the app we have initially Stateless widget running, then the init state which calls the function of api call which obviously take time till then the build function executes and later comes the data but………. we will not be able to see the data. why ?
    
    because after the api call fetches data there is nothing which says to reload the build function so that we can see the change so somehow we have to tell inside the fetching data function after getting the data rebuild the widget which is done by
    
- **Answer : SetState()**
    
    so as soon as the api call is success we will put a setstate to rebuild the widget and now we can see the changes.
    
- **Loading : Progress Indicator**
    
    while the function is taking time to fetch the data we have the blank screen which is not good user interface so we should provide a loading functionality.
    
    ![Untitled](https://prod-files-secure.s3.us-west-2.amazonaws.com/d9cae9ef-3055-4950-ba00-f986f939cb16/ef40a935-f272-42fd-9d15-fe0fdfc13016/Untitled.png)(refer to notion.so)
    
    but doing by variable is a big task because
    
    **Problem :**
    
    if something goes wrong in the fetching the data is_Loading will not be able to change to false then the progress indicator keeps on running so manually we should go to each and every position where there might be error and again set them to is_Loading to false which is time consuming and long task.
    
    so for this we have a solution from flutter 
    
    **Answer : FutureBuilder()**
    
    provided by flutter.
    
    FutureBuilder takes two properties which keys are future and builder as the name suggest.
    
    The future takes it value as the async function you want to execute
    
    while builder also takes the anonymous function which gets the params as context and snapshot.
    
    ```dart
    FutureBuilder(
    	future : getData(),
    	builder : (context, snapshot)=> Text("eswar", textDirection : TextDirection.ltr);
    )
    ```
    
    Future Builder gives you easiest ways to handle errors get the data and also Progress Indicators.
    
    if you print out the snapshot you will get the data if success.
    
    you can also print the runtimeType to see what it gives you.
    
    ```dart
    FutureBuilder(
    	future : getData(),
    	builder : (context, snapshot)=> {
    		print(snapshot);
    		print(snapshot.runtimeType);
    		return Text("eswar", textDirection : TextDirection.ltr);
    	}
    )
    ```
    
    we can now configure for all conditions here itself
    
    ```dart
    FutureBuilder(
    	future : getData(),
    	builder : (context, snapshot)=> {
    		
    		
    		//configure for waiting state
    		if(snapshot.connectionState == connectionState.waiting)
    		{
    			return CircularProgressBar.adaptive();
    		}
    		
    		if(snapshot.hasError)
    		{
    			return Text(snapshot.error.toString());
    		} 
    
    		return Text("eswar", textDirection : TextDirection.ltr);
    	}
    )
    ```
    
    now we can get the data and store it in the variable.
    
    ```dart
    FutureBuilder(
    	future : getData(),
    	builder : (context, snapshot)=> {
    		
    		
    		//configure for waiting state
    		if(snapshot.connectionState == connectionState.waiting)
    		{
    			return CircularProgressBar.adaptive();
    		}
    		
    		if(snapshot.hasError)
    		{
    			return Text(snapshot.error.toString());
    		} 
    
    		final data = snapshot.data!;
    
    		return Text("eswar", textDirection : TextDirection.ltr);
    	}
    )
    ```
    
    we don’t keep changing the data so we can use final.
    
    we make sure that data is not nullable so we put the case here.
    
    remember that our data is present in snapshot.data
    
    ```dart
    	final data = snapshot.data!;
    ```
    
    but where should we use this FutureBuilder we wrap the entire widget with FutureBuilder in the body
    
- fill the card1 card3 and now card2