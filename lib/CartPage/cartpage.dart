import 'package:flutter/material.dart';
import 'package:helloworld/providers/cart_provider.dart';
// import "../products.dart";
import "package:provider/provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartProvider>().cart;
    // final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "cart",
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cart[index]["image_url"]),
            ),
            title: Text("${cart[index]["title"]}"),
            subtitle: Text("size : ${cart[index]["size"]}"),
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                    barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Delete Title",
                              style: Theme.of(context).textTheme.titleMedium),
                          content:
                              const Text("Are you sure you want to delete?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "No",
                                style : TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),

                            TextButton(
                              onPressed: () {
                                context.read<CartProvider>().removeProduct(cart[index]);
                                // Provider.of<CartProvider>(context, listen : false).removeProduct(cart[index]);
                                Navigator.of(context).pop();
                              },
                              child: const Text(
                                "Yes",
                                style : TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(Icons.delete)),
          );
        },
      ),
    );
  }
}
