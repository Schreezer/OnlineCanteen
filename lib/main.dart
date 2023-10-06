import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_canteen/resources/authMethods.dart';
import 'package:online_canteen/responsive/mobile.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChannels.platform.invokeMethod('SystemChrome.setPreferredOrientations', ['EGL_emulation', 'OFF']);
  debugPrint("disable", wrapWidth: 100);
    if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
      apiKey: "AIzaSyDavr5e5lX_bjFhj_ypC0k31FTLgg1sa2Y",
      appId: "1:442246223634:web:7b3b30f43344b4bbfdc5cb",
      messagingSenderId: "442246223634",
      projectId: "online-canteen-906b5",
      storageBucket: "online-canteen-906b5.appspot.com",
    ));

  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
   Widget build(BuildContext context) {
    SystemChannels.platform.invokeMethod('SystemChrome.setPreferredOrientations', ['EGL_emulation', 'OFF']);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>AuthMethods(),
        ),
      ],
      child: const MaterialApp(
        home: MobileScreen(),));
    
  }
}