import "package:flutter/material.dart";
import "package:online_canteen/resources/authMethods.dart";

class _CartScreen extends StatefulWidget {
  String userId;
  _CartScreen({required this.userId});

  @override
  State<_CartScreen> createState() => __CartScreenState();
}

class __CartScreenState extends State<_CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Placeholder();
    // FutureBuilder(future: fetchCart('f5qSaaor73DO12VpqhPJ', ), builder: aListBuilder);
  }
}
