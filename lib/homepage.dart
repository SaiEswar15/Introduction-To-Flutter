import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    
    const textborder = OutlineInputBorder(
      borderSide: BorderSide(),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(30),
      ),
    );

    return const Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Shoes\nCollections",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: textborder,
                enabledBorder: textborder,
                prefixIcon: Icon(
                  Icons.search,
                ),
                hintText: "Search",
              ),
            ),
          ),
        ],
      )),
    );
  }
}
