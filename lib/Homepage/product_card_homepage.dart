import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String picture;
  final dynamic bgcolor;

  const ProductCard(
    {
      super.key,
      required this.title,
      required this.price,
      required this.picture,
      required this.bgcolor,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: const EdgeInsets.all(16.0),
      margin :  const EdgeInsets.all(8.0),
      decoration : BoxDecoration(
        color: bgcolor,
        borderRadius: BorderRadius.circular(20),
      ),
      height : 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style : Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height : 3,
          ),
          Text(
            "price : \$ $price",
            style : Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(
            height : 3,
          ),
          Center(
            child: Image(
              image: AssetImage(picture),
              height : 175,
            ),
          ),
        ],
      ),
    );
  }
}
