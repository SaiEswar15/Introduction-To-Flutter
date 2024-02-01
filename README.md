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