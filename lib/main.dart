import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trojan_wave/profile.dart';
import './home.dart';
import './login.dart';

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
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) => setState(() {
            index = value;
          }),
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
          ],
        ),
        body: _getBody(index),
      ),
    );
  }

  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const Home(); // Create this function, it should return your first page as a widget      // Create this function, it should return your second page as a widget
      case 1:
        return FirebaseAuth.instance.currentUser == null
            ? const Profile()
            : const LoginScreen(); // Create this function, it should return your third page as a widget
    }

    return const Center(
      child: Text("There is no page builder for this index."),
    );
  }
}
