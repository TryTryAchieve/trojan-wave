import 'package:flutter/material.dart';

import 'buy_page.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Text(
                "Trojan Wave",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text("Buy best products here.. Secured !!"),
            ),
            CatalogItem(
                productName: "Wheat",
                sellerName: "Sushant",
                quantityInKgs: "1000",
                distanceInKms: "150"),
          ],
        ),
      ),
    );
  }
}

class CatalogItem extends StatelessWidget {
  const CatalogItem(
      {Key? key,
      required this.productName,
      required this.sellerName,
      required this.quantityInKgs,
      required this.distanceInKms})
      : super(key: key);
  final String productName;
  final String sellerName;
  final String quantityInKgs;
  final String distanceInKms;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              "https://picsum.photos/200",
              height: 125,
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                sellerName,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                "$quantityInKgs Kgs",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                "$distanceInKms Kms",
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BuyPage()),
              );
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
            child: const Text("Buy"),
          ),
        ],
      ),
    );
  }
}
