// import 'package:flutter/material.dart';

// class GetGridProductList extends StatefulWidget {
//   const GetGridProductList({super.key});

//   @override
//   State<GetGridProductList> createState() => _GetGridProductListState();
// }

// class _GetGridProductListState extends State<GetGridProductList> {
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         childAspectRatio: 1.2,
//       ),
//       itemCount: products.length,
//       itemBuilder: (context, index) {
//         final list = products;
//         return GestureDetector(
//           onTap: () {
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) {
//                   return Productpage(product: list[index]);
//                 },
//               ),
//             );
//           },
//           child: ProductCard(
//             title: list[index]["title"],
//             price: list[index]["price"],
//             picture: list[index]["image_url"] as String,
//             bgcolor: getColorForIndex(index),
//           ),
//         );
//       },
//     );
//     ;
//   }
// }
