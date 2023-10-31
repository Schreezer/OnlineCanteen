import "package:flutter/material.dart";

class ScreenWrapper extends StatefulWidget {
  final Widget displayScreen;
  final String title;
  const ScreenWrapper({required this.title, required this.displayScreen,super.key});

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: widget.displayScreen,
    );
  }
}