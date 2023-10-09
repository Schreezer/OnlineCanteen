import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:online_canteen/models/foodItem.dart";
import "package:online_canteen/resources/firestoreMethods.dart";

class cartItem {
  String canteenId;
  String itemId;
  int quantity;

  cartItem({
    required this.canteenId,
    required this.itemId,
    required this.quantity,
  });
  static cartItem fromSnap(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;
    return cartItem(
      canteenId: data['canteenId'],
      itemId: data['itemId'],
      quantity: data['quantity'],
    );
  }
}
