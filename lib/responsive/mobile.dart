import "package:flutter/material.dart";
import "package:online_canteen/screens/canteenSelection.dart";
import "package:online_canteen/widgets/canteenCard.dart";

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Canteen Selection"),
      ),
      body: CanteenSelection(),
      // ListView(
      //   children: [
      //    CanteenCard(
      //     canteenName: "Canteen 1",
      //     canteenLocation: "Location 1",
      //     canteenDescription: "Description 1",
      //     canteenImage: "https://loremflickr.com/320/240/food",
      //   ),
      //   ],
      // )
    );
  }
}
