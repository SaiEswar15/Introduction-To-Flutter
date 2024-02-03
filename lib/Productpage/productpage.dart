import 'package:flutter/material.dart';
import "../products.dart";

class Productpage extends StatefulWidget {
  final Map<String, dynamic> product;

  const Productpage({super.key, required this.product});

  @override
  State<Productpage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productpage> {
  int selectedSize = 0;

  @override
  void initState() {
    super.initState();
    selectedSize = products[0]["sizes"]?[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Text(
            products[0]["title"],
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(flex: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image(
              image: AssetImage(products[0]["image_url"]),
              height: 300,
            ),
          ),
          const Spacer(flex: 2),
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    " \$ ${products[0]["price"]}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: products[0]["sizes"].length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = products[0]["sizes"][index];
                              });
                            },
                            child: Chip(
                              label: Text("${products[0]["sizes"][index]}"),
                              backgroundColor:
                                  selectedSize == products[0]["sizes"][index]
                                      ? Theme.of(context).colorScheme.primary
                                      : null,
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(double.infinity, 50),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.shopping_cart),
                          color: Colors.black,
                        ),
                        const Text(
                          "Add to cart",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
