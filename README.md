# Important concepts in the project.

### creating a `main` function :

--

### create a class with a custom stateless widget `MyApp` :

--

### pass the custom widget into the main function :

--

### create a widget with `MaterialApp()` :

--

### Now pass on the separate pages inside MaterialApp() Widget :

--

### Remember that each page widget class will have AppBar and body so that they are perfectly aligned so use `Scaffold()`

--


### Usage of fonts :

there is a method in which the fonts will come to our project by the usage of http which is by using the google_fonts [pub. dev](http://pub.dev). Using this there will be a small delay which we can observe while following this method.

So we will configure the font in our project so that there will be no delays in showing the fonts.

We provide fonts in `fonts` in our .yaml file. it will be available under the assets column.

we can uncomment and add fonts underneath.

be careful about the very particular indentation.

```yaml
fonts:
    - family: Honk
      fonts:
        - asset: assets/fonts/Honk-Regular.ttf
```

this will load the font into the project.

Loading the project doesn’t mean it will be affecting the whole project.

we have to use the font for a widget(ex: Text()) only then you will be able to use the font

```dart
const Text(
            "OUTFIT GALLERY",
            style : TextStyle(
              fontFamily: "Honk",
              fontSize: 25,
            ),
          ),
```

only now the font will be available for this particular Widget.

--

### theming the fonts :

though from the above we were able to apply font for our widget but we have to apply the font for every widget manually which is not feasible. so we have to automate it so that we don’t have to keep applying the font for every widget which we can achieve by theming universally at the root widget which is MyApp

```dart
MaterialApp(
      home: const Homepage(),
      theme: ThemeData(
        fontFamily: "DancingScript"
      ),
      debugShowCheckedModeBanner: false,
    );
```

now if we don’t particularly add font for the widget it will by default be Dancing-Script or if added it will be overridden.

--

### Colour theming `ColorScheme` :

for adding font-Family we have removed the ThemeData.dark() 

so now we lost the colour theme of the project.

now we need to find a way to add a colour theme for our project without the ThemeData.dark() method which is provided by ColorScheme

```dart
MaterialApp(
      home: const Homepage(),
      theme: ThemeData(
        fontFamily: "DancingScript",
        colorScheme: const ColorScheme.dark()
      ),
      debugShowCheckedModeBanner: false,
    );
```

but if we want to give a color palette to the entire app we can use `ColorScheme()`

```dart
MaterialApp(
      home: const Homepage(),
      theme: ThemeData(
        fontFamily: "DancingScript",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      debugShowCheckedModeBanner: false,
    );
```

using from seed we will get the derivative colours for different stages like primary, secondary and various and we can assign manually by just using the `ColorScheme()` we have to pass in all manually but using from seed we don’t need to provide all this will automatically generate all the required coloured palette.

--

### Creating Navbar `SafeArea()`:

Up until now, we have created a navbar by using the scaffold app bar but we want to create our navbar by removing the app bar from Scaffold.

if we remove the app bar the consequence is that the text will go on to the top.

to avoid this we have a widget called `SafeArea()`

using this the project will ignore the space above and also the space below(notch)

If we want our widgets to be side by Side we use the `Row()` widget.

### `Expanded` :

we have one widget in the row and the other widget is the input field there will be an error why?

because the input field takes the entire screen.

so give it a limited space we might think of using a `SizedBox()` but there will be an issue by doing so which appears different in different devices

so we have to wrap the input text in `Expanded()`

to make all the input fields similar we can theme it by using the input theme decoration 

```dart
theme: ThemeData(
        fontFamily: "DancingScript",
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.grey,
          ),
        ),
```

### `OutlinedInputBorder`

if we want to give a border for the text field you will find it in the decoration and use the border.

but for the border, we will have the Border() as an abstract class so we can use it.

`OutlinedInputBorder`