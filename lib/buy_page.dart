import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BuyPage extends StatelessWidget {
  final String productName;
  final String sellerName;
  final String quantityInKgs;
  final String distanceInKms;
  final String imageLink;
  final String itemId;
  final String prizePerKg;
  const BuyPage({
    Key? key,
    required this.productName,
    required this.sellerName,
    required this.quantityInKgs,
    required this.distanceInKms,
    required this.imageLink,
    required this.itemId,
    required this.prizePerKg,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            // passing this to our root
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  imageLink,
                  height: 200,
                ),
                const SizedBox(height: 30),
                Column(
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                    Text(
                      "$sellerName Seller",
                      style: const TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      "$distanceInKms KMs",
                      style: const TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      "$prizePerKg per Kg",
                      style: const TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.all(10),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Max Quantity $quantityInKgs Kgs",
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Text("Proceed Order"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
