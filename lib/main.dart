import 'package:flutter/material.dart';

void main() 
{
  runApp(const MyApp());  //const is a compile time mutable
}

class MyApp extends StatelessWidget{

  const MyApp({ super.key });

  // const Text("eswar", textDirection : TextDirection.ltr);
  @override
  Widget build(BuildContext context){
    return const Text("eswar", textDirection: TextDirection.ltr);
  }
}