import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'ListModel.dart'; 
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    print(ListModel);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 18),
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 40.0,
                backgroundImage: AssetImage('assets/images/pic.png'),
              ),
            ),
            Divider(
              color: Colors.grey[800],
              height: 60.0,
            ),
            const Text(
              'Email',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'user@email.com',
              style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 30.0),
            const Text(
              'Location',
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              'New Delhi, India',
              style: TextStyle(
                color: Colors.blue[700],
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
                letterSpacing: 2.0,
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.of(context).pop();
              },
              child: const Text("Logout"),
            ),

          ],
        ),
      ),
    );
  }
}
