import 'package:flutter/material.dart';
import "../products.dart";
import './product_card_homepage.dart';
import "../Productpage/productpage.dart";

class ProductListHome extends StatefulWidget {
  const ProductListHome({super.key});

  @override
  State<ProductListHome> createState() => _ProductListHomeState();
}

class _ProductListHomeState extends State<ProductListHome> {
  final List<String> list = const [
    "All",
    "Nike",
    "Adidas",
    "Puma",
    "Bata",
    "Crocs",
    "Roadstar"
  ];

  late String selected;

  @override
  void initState() {
    super.initState();
    selected = list[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const textborder = OutlineInputBorder(
      borderSide: BorderSide(),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(30),
      ),
    );

    const borderedRadius = ShapeDecoration(
      color: Colors.blueAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20),
          right: Radius.circular(20),
        ),
      ),
    );

    Color getColorForIndex(int index) 
    {
      if (index % 4 == 0) {
        // First index
        return const Color.fromARGB(233, 195, 217, 254);
      } else if (index % 4 == 1 || index % 4 == 2) {
        // Second and third indices
        return const Color.fromARGB(221, 225, 243, 251);
      } else {
        // Fourth index
        return const Color.fromARGB(233, 195, 217, 254);
      }
    }

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Shoes\nCollections",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Expanded(
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
          ),
          ColoredBox(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: SizedBox(
              height: 50,
              width: 600,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: borderedRadius,
                      width: 70,
                      child: Center(
                        child: Text(
                          list[index],
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          ColoredBox(
            color: Colors.white,
            child: SizedBox(
              height: 50,
              width: 600,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ColoredBox(
                      color: Colors.white,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = list[index];
                          });
                        },
                        child: Chip(
                          label: Text(list[index]),
                          labelStyle: TextStyle(
                            color: selected == list[index]
                                ? Colors.black
                                : Colors.white,
                          ),
                          backgroundColor: selected == list[index]
                              ? Theme.of(context).primaryColor
                              : Colors.lightGreen,
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30),
                              right: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: size.width > 620
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.2,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final list = products;
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Productpage(product: list[index]);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: list[index]["title"],
                          price: list[index]["price"],
                          picture: list[index]["image_url"] as String,
                          bgcolor: getColorForIndex(index),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final list = products;
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return Productpage(product: list[index]);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                            title: list[index]["title"],
                            price: list[index]["price"],
                            picture: list[index]["image_url"] as String,
                            bgcolor: index.isEven
                                ? const Color.fromARGB(233, 195, 217, 254)
                                : const Color.fromARGB(221, 225, 243, 251)),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
