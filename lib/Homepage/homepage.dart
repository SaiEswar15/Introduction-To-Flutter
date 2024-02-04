import 'package:flutter/material.dart';
import 'package:helloworld/CartPage/cartpage.dart';
import "./product_list_homepage.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  
  int currentpage = 1;
  List<Widget> pages = const [ProductListHome(), CartPage()];

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      body: IndexedStack(
        index: currentpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
              onTap : (value){
                setState(() {
                  currentpage = value;
                }); 
              },
              iconSize: 30,
              selectedFontSize: 0,
              unselectedFontSize: 0,
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
