import 'package:flutter/material.dart';

class CurrencyConverter extends StatelessWidget {

  

  const CurrencyConverter({super.key});

  @override
  Widget build(BuildContext context) {
    double result = 0;

    final TextEditingController textEditingController = TextEditingController();

    const border = OutlineInputBorder(
      borderSide: BorderSide(
          color: Color.fromARGB(255, 0, 0, 0),
          width: 2.0,
          style: BorderStyle.solid,
          strokeAlign: BorderSide.strokeAlignCenter),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(10),
        right: Radius.circular(10),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 4, 97, 101),
        centerTitle: true,
        title: const Text(
          "currency converter",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ColoredBox(
        color: const Color.fromARGB(255, 40, 104, 106),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                result.toString(),
                style: const TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                // color: Colors.amber,
                // padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController,
                  style: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontFamily: "arial",
                      fontWeight: FontWeight.normal),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.monetization_on_outlined),
                    hintText: "enter the amount you want to convert into INR",
                    hintStyle: TextStyle(
                      color: Color.fromARGB(105, 5, 5, 5),
                      fontStyle: FontStyle.italic,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                    signed: true,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                // color: Colors.amber,
                // padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    result = double.parse(textEditingController.text) * 81;
                  },
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
                  child: const Text("convert"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
