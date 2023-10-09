import "dart:async";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import "package:online_canteen/models/canteen.dart";
import "package:online_canteen/models/cartItem.dart";
import "package:online_canteen/models/foodItem.dart" as foo;
import "package:uuid/uuid.dart";

class FirestoreMethods {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  // Access to this function will be only available to the adminstrator,
  // or the president, the aim being they will not be needed to access
  // the database, but instead just have the capability to add from
  // the application itself.
  Future<String> addCanteen(
    String name,
    String description,
    String imageUrl,
    String location,
  ) {
    var completer = Completer<String>();
    String res = "success";
    String uid = const Uuid().v1();
    try {
      _fireStore.collection("canteens").doc(uid).set({
        "name": name,
        "description": description,
        "image": imageUrl,
        "location": location,
      });
      completer.complete(res);
    } catch (e) {
      res = e.toString();
      completer.complete(res);
    }
    return completer.future;
  }

  Future<String> addFoodItem(
    String name,
    String description,
    String imageUrl,
    String price,
    String canteenId,
    String itemId,
  ) {
    var completer = Completer<String>();
    String res = "success";
    String uid = const Uuid().v1();
    try {
      _fireStore
          .collection("canteens")
          .doc(canteenId)
          .collection("foodItems")
          .doc(uid)
          .set({
        "name": name,
        "description": description,
        "image": imageUrl,
        "price": price,
      });
      completer.complete(res);
    } catch (e) {
      res = e.toString();
      completer.complete(res);
    }
    return completer.future;
  }

  Future<String> addToCart(
    String name,
    String description,
    String imageUrl,
    String price,
    String canteenId,
    String uid,
  ) {
    var completer = Completer<String>();
    String res = "success";
    try {
      _fireStore
          .collection("users")
          .doc(uid)
          .collection("cart")
          .doc(canteenId)
          .collection("foodItems")
          .doc()
          .set({
        "name": name,
        "description": description,
        "image": imageUrl,
        "price": price,
      });
      completer.complete(res);
    } catch (e) {
      res = e.toString();
      completer.complete(res);
    }
    return completer.future;
  }

// Future <String> addToHistory(

//     String orderId,
//     String uid,
//     String canteenId,
//     String
//   ){
//     var completer = Completer<String>();
//     String res = "success";
//     try{
//       _fireStore.collection("users").doc(uid).collection("history").doc(orderId).set({
//         "name":name,
//         "description":description,
//         "image":imageUrl,
//         "price":price,
//         "canteenId":orderId,
//       });
//       completer.complete(res);
//     }catch(e){
//       res = e.toString();
//       completer.complete(res);
//     }
//     return completer.future;
//   }
}

// fetch canteens from the firebase database
Future<List<Canteen>> fetchCanteens() {
  CollectionReference canteens =
      FirebaseFirestore.instance.collection('canteens');
  return canteens.get().then((QuerySnapshot querySnapshot) {
    List<Canteen> canteensList = [];
    querySnapshot.docs.forEach((doc) {
      canteensList.add(Canteen.fromSnap(doc));
    });
    return canteensList;
  });
}

// this function will fetch the food item from the car,
// since each item in the cart will have foodItemId, canteenId and quantity
Future<foo.foodItem> fetchFoodItem(String canteenId, String foodItemId) {
  DocumentReference foodItem = FirebaseFirestore.instance
      .collection('canteens')
      .doc(canteenId)
      .collection("foodItems")
      .doc(foodItemId);
  List<foo.foodItem> foodItemsList = [];
  return foodItem.get().then((DocumentSnapshot doc) {
    return foo.foodItem.fromSnap(doc);
  });
}

Future<List<foo.foodItem>> fetchMenu(String canteenId) {
  print("fetching menu");
  CollectionReference foodItems = FirebaseFirestore.instance
      .collection('canteens')
      .doc(canteenId)
      .collection("foodItems");
  return foodItems.get().then((QuerySnapshot querySnapshot) {
    List<foo.foodItem> foodItemsList = [];
    // print the length of the querySnapshot
    print(querySnapshot.docs.length);
    querySnapshot.docs.forEach((doc) {
      print("adding");
      foodItemsList.add(foo.foodItem.fromSnap(doc));
    });
    print(foodItemsList.length);
    return foodItemsList;
  });
}

Future<Map<foo.foodItem, int>> fetchCart(String uid, String canteenId) {
  CollectionReference cart = FirebaseFirestore.instance
      .collection('users')
      .doc(uid)
      .collection("cart")
      .doc(canteenId)
      .collection("cart");
  return cart.get().then((QuerySnapshot querySnapshot) {
    Map<foo.foodItem, int> cartList = {};
    querySnapshot.docs.forEach((doc) {
      cartItem item = cartItem.fromSnap(doc);
      fetchFoodItem(item.canteenId, item.itemId).then((value) {
        cartList[value] = item.quantity;
      });
    });
    return cartList;
  });
}
