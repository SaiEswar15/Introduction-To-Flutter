import 'package:flutter/material.dart';
import 'package:helloworld/providers/cart_provider.dart';
// import "../products.dart";
import "package:provider/provider.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title : const Text(
          "cart",
        ),
      ),
      body : ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index){
          return ListTile(
            leading : CircleAvatar(
              backgroundImage: AssetImage(cart[index]["image_url"]),
            ),
            title : Text("${cart[index]["title"]}"),
            subtitle: Text("size : ${cart[index]["size"]}"),
            trailing : const Icon(Icons.delete),
          );
        },
      ),
    );
  }
}