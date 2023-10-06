import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class Order{
  String orderId;
  String userId;
  String canteenId;
  // a map of food order ids and thier quantity
  Map<String,int> foodItems;
  String status;
  String cost;
  String date_time;
  Order({
    required this.orderId,
    required this.userId,
    required this.canteenId,
    required this.foodItems,
    required this.status,
    required this.cost,
    required this.date_time,
  });
  Map <String,dynamic> toMap(){
    return {
      "orderId":orderId,
      "userId":userId,
      "canteenId":canteenId,
      "foodItems":foodItems,
      "status":status,
      "cost":cost,
      "date_time":date_time,
    };
  }
  static Order fromSnap(DocumentSnapshot snap){
    final data = snap.data() as Map<String,dynamic>;
    return Order(
      orderId: data['orderId'],
      userId: data['userId'],
      canteenId: data['canteenId'],
      foodItems: data['foodItems'],
      status: data['status'],
      cost: data['cost'],
      date_time: data['date_time'],
    );
  }
  
}