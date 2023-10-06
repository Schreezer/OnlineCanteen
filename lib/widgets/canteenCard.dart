import 'package:flutter/material.dart';

class CanteenCard extends StatefulWidget {
  String canteenName;
  String canteenImage;
  String? canteenDescription;
  String canteenLocation;

  CanteenCard({
    required this.canteenName,
    required this.canteenLocation,
    this.canteenDescription,
    required this.canteenImage,
    Key? key,
  }) : super(key: key);

  @override
  State<CanteenCard> createState() => _CanteenCardState();
}

class _CanteenCardState extends State<CanteenCard> {
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
            widget.canteenName,
            style: const TextStyle(
              fontSize: 24, // Increase the font size to make the title larger
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Image.network(
                widget.canteenImage,
                width: 30,
                height: 30,
              ),
              const SizedBox(width: 10),
              Text(
                widget.canteenDescription ?? " ",
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
                Icons.location_on,
                color: Colors.blue.shade200,
                size: 16,
              ),
              Text(
                widget.canteenLocation,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
