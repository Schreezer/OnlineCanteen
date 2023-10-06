import "package:flutter/material.dart";
import "package:online_canteen/widgets/addToCart.dart";

class ItemCard extends StatefulWidget {
  const ItemCard({
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
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:
            Colors.yellow.shade200, // Set the background color to light yellow
        border: Border.all(
          color:
              Colors.yellow.shade400, // Set the border color to darker yellow
          width: 1, // Set the border width to create a thin boundary
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            widget.name,
            style: const TextStyle(
              fontSize: 24, // Increase the font size to make the title larger
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Image.network(
                widget.image ?? "https://loremflickr.com/320/240/food",
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              Text(
                widget.description ?? " ",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: Container()),
              Icon(
                Icons.currency_rupee,
                color: Colors.blue.shade200,
                size: 16,
              ),
              Text(
                widget.price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            // two evenly spaced buttons called "Buy Now" and "Add to Cart"
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // add the item to the cart
                  // Navigator.pop(context);
                },
                child: const Text("Buy Now"),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Material(
                        child: AddDialog(
                          name: widget.name,
                          itemId: widget.itemId,
                          canteenId: widget.canteenId,
                        ),
                      );
                    },
                  );
                },
                child: const Text("Add to Cart"),
              )
            ],
          )
        ],
      ),
    );
  }
}
