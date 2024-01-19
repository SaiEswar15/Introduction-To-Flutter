import "package:flutter/cupertino.dart";

class CurrencyConverterCupertinoPage extends StatefulWidget {
  @override
  const CurrencyConverterCupertinoPage({super.key});

  @override
  State createState() => _CurrencyConverterCupertinoState();
}

class _CurrencyConverterCupertinoState extends State {
  double result = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        // elevation: 10, we dont have elevations in apple
        backgroundColor: CupertinoColors.systemCyan,
        middle: Text(
          "currency converter",
          style: TextStyle(
            color: CupertinoColors.white,
          ),
        ),
      ),
      child: ColoredBox(
        color: CupertinoColors.systemCyan,
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
              CupertinoTextField(
                controller: textEditingController,
                placeholder: "enter the amount you want to convert into INR",
                placeholderStyle: const TextStyle(
                  color: CupertinoColors.systemGrey,
                  fontStyle: FontStyle.italic,
                ),
                style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontFamily: "arial",
                    fontWeight: FontWeight.normal
                ),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
              ),
              Container(
                //Button
                margin: const EdgeInsets.all(8.0),
                // color: Colors.amber,
                // padding: const EdgeInsets.all(8.0),
                child: CupertinoButton(
                  onPressed: () {
                    setState(() {
                      result = double.parse(textEditingController.text) * 81;
                    });
                  },
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
