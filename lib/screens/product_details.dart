import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProductDetails extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final int price;
  final int quantity;

  ProductDetails({
    required this.image,
    required this.title,
    required this.description,
    required this.price,
    required this.quantity,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late int _currentQuantity;

  @override
  void initState() {
    _currentQuantity = widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Image.network("http://10.0.2.2:9090/img/" + widget.image,
                  width: 460, height: 215)),
          Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 50),
            child: Text(widget.description),
          ),
          Text(widget.price.toString() + " TND", textScaleFactor: 3),
          Text("Exemplaires disponibles : " + _currentQuantity.toString()),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: ElevatedButton.icon(
                label: const Text("Acheter", textScaleFactor: 2),
                icon: const Icon(Icons.shopping_basket_rounded),
                onPressed: () {
                  setState(() async {
                    Database database = await openDatabase(
                      join(await getDatabasesPath(),
                          "gstore_esprit_database.db"),
                    );

                    Map<String, dynamic> game = {
                      "image": "http://10.0.2.2:9090/img/" + widget.image,
                      "price": widget.price
                    };

                    await database.insert("basket", game,
                        conflictAlgorithm: ConflictAlgorithm.replace);

                    // List<Map<String, dynamic>> maps = await database.query("basket");
                    // print(maps);

                    Navigator.pop(context);
                  });
                }),
          )
        ],
      ),
    );
  }
}
