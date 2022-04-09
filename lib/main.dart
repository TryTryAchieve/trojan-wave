import 'package:flutter/material.dart';
import 'package:trojan_wave/search.dart';
import './home.dart';
import './login.dart';

void main() {
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
              icon: Icon(Icons.search),
              label: "Search",
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
        return const Home(); // Create this function, it should return your first page as a widget
      case 1:
        return const Search(); // Create this function, it should return your second page as a widget
      case 2:
        return const Login(); // Create this function, it should return your third page as a widget
    }

    return const Center(
      child: Text("There is no page builder for this index."),
    );
  }
}
