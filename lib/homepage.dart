import 'package:flutter/material.dart';
import "./products.dart";
import "./product_card.dart";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<String> list = const ["All", "Nike", "Adidas", "Puma", "Bata"];

  late String selected;

  @override
  void initState() {
    super.initState();
    selected = list[0];
  }

  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
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
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final list = products;
                  return ProductCard(
                      title: list[index]["title"],
                      price: list[index]["price"],
                      picture: list[index]["image_url"] as String,
                      bgcolor: index.isEven
                          ? const Color.fromARGB(233, 195, 217, 254)
                          : const Color.fromARGB(221, 225, 243, 251));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
