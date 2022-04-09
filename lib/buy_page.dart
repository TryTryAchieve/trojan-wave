import 'package:flutter/material.dart';

class BuyPage extends StatelessWidget {
  const BuyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.network(
                  "https://picsum.photos/200",
                  height: 200,
                ),
                const SizedBox(height: 30),
                Column(
                  children: const [
                    Text(
                      "Wheat",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32.0,
                      ),
                    ),
                    Text(
                      "Sushant Seller",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                    Text(
                      "150 KMs",
                      style: TextStyle(
                        fontSize: 17.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.all(10),
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Max Quantity 1000 Kgs",
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
