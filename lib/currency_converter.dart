import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget {
  const CurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
          color: Color.fromARGB(255, 0, 0, 0),
          width: 2.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(20),
        right: Radius.circular(20),
      ),
    );

    return Scaffold(
      body: ColoredBox(
        color: const Color.fromARGB(55, 203, 253, 37),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "0",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                  margin: const EdgeInsets.all(8.0),
                  color : Colors.amber,
                  padding: const EdgeInsets.all(8.0),
                  child: const TextField(
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontFamily: "arial",
                        fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.monetization_on_outlined),
                      hintText: "enter your text here",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(105, 5, 5, 5),
                        fontStyle: FontStyle.italic,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
