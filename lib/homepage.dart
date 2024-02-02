import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  final List<String> list = const ["All", "Nike", "Adidas", "Puma", "Bata"];

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
                        decoration : borderedRadius,
                        width: 70,
                        child: Center(
                          child: Text(
                            list[index],
                            style: const TextStyle(
                              color : Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
