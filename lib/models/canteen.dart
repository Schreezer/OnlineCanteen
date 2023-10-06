import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class Canteen{
  String name;
  String description;
  String location;
  String? image;

  Canteen({
    required this.name,
    required this.description,
    required this.location,
    this.image
  });
  
  Map <String,dynamic> toMap(){
    return {
      "name":name,
      "description":description,
      "location":location,
      "image":image,
    };
  }
  static Canteen fromSnap(DocumentSnapshot snap){
    final data = snap.data() as Map<String,dynamic>;
    return Canteen(
      name: data['name'],
      description: data['description'],
      location: data['location'],
      image: data['image'],
    );
  }
}