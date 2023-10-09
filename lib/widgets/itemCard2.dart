import "package:flutter/material.dart";
import "package:online_canteen/resources/firestoreMethods.dart";

class ItemCard2 extends StatefulWidget {
  ItemCard2({
    Key? key,
    this.veg = true,
    required this.name,
    required this.description,
    required this.price,
    this.image,
    required this.itemId,
    required this.canteenId,
  }) : super(key: key);
  final String itemId;
  final String canteenId;
  final String name;
  bool veg;
  final String description;
  final String price;
  final String? image;
  @override
  State<ItemCard2> createState() => _ItemCard2State();
}

class _ItemCard2State extends State<ItemCard2> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(
          children: [widget.veg==true? const Icon(Icons.dining_outlined,color: Colors.green,):const Icon(Icons.dining_outlined,color: Colors.red,),
            Text(widget.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text(widget.price),

          ]
        )
      ]),
    );
  }
}
