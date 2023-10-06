import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String name;
  final String? email;
  final String uid;
  final String? entryNumber;
  final String phoneNumber;
  final String? photoUrl;

  const User({
    this.email,
    required this.uid,
    required this.name,
    this.photoUrl,
    this.entryNumber,
    required this.phoneNumber,
  });

  Map<String,dynamic> toMap(){
    return {
      "name":name,
      "email":email,
      "uid":uid,
      "entryNumber":entryNumber,
      "phoneNumber":phoneNumber,
      "photoUrl":photoUrl,
    };
  }
  static User fromSnap(DocumentSnapshot snap) {
    final data = snap.data() as Map<String, dynamic>;
    return User(
      name: data['name'],
      email: data['email'],
      uid: data['uid'],
      entryNumber: data['entryNumber'],
      phoneNumber: data['phoneNumber'],
      photoUrl: data['photoUrl'],
    );
  }

}