import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class foodItem{
  String name;
  String description;
  String price;
  String? image;
  String canteenId;
  String foodItemId;
  bool veg;

  foodItem({
    required this.name,
    required this.description,
    required this.price,
    this.image,
    required this.veg,
    required this.canteenId,
    required this.foodItemId,
  });
  Map <String,dynamic> toMap(){
    return {
      "name":name,
      "description":description,
      "price":price,
      "image":image,
      "canteenId":canteenId,
      "foodItemId":foodItemId,
      "veg": veg,
    };
  }
  static foodItem fromSnap(DocumentSnapshot snap){
    final data = snap.data() as Map<String,dynamic>;
    return foodItem(
      name: data['name'],
      description: data['description'],
      price: data['price'],
      image: data['image'],
      canteenId: data['canteenId'],
      foodItemId: data['item_id'],
      veg: data['veg'],
    );
  }
}