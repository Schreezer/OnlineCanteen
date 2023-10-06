import "package:flutter/material.dart";
import "package:online_canteen/resources/firestoreMethods.dart";

class ItemCard2 extends StatefulWidget {
  const ItemCard2({
    Key? key,
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
  final String description;
  final String price;
  final String? image;

  @override
  State<ItemCard2> createState() => _ItemCard2State();
}

class _ItemCard2State extends State<ItemCard2> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchMenu(widget.canteenId),
      builder: (context, snapshot) {
        return Material(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [],
            )
          ]),
        );
      },
    );
  }
}
