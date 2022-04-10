import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import './home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBNS_SqSIM6SJf83V_kAFaIKV12M11XzvI",
      appId: "1:69498378939:android:f9abe91d5de7bf01c9279e",
      messagingSenderId: "69498378939",
      projectId: "trojan-wave-18b2e",
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'trojan wave',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
