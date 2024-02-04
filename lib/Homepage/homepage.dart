import 'package:flutter/material.dart';
import "./product_list_homepage.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: const ProductListHome(),
      bottomNavigationBar: BottomNavigationBar(
              onTap : (value){
                setState(() {
                  currentpage = value;
                }); 
              },
              currentIndex: currentpage,
              items : const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label : "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart),
                  label : "",
                ),
              ],
            ),
    );
  }
}
