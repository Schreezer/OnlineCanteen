import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  late ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:Scaffold(
      appBar: AppBar(
        title: const Text('APP NAME'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Login', style: TextStyle(color: Colors.black,fontSize: 50,),),
            TextField(autofillHints:'Username',),
          ],
        ),
      ),
    ));
  }
}
