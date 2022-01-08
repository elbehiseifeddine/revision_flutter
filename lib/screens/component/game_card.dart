import 'package:flutter/material.dart';
import 'package:rev/data/games.dart';
import 'package:rev/screens/product_details.dart';

GestureDetector GameCard(int index, List<Games> _games, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductDetails(
            title: _games[index].title,
            image: _games[index].image,
            quantity: _games[index].quantity,
            description: _games[index].description,
            price: _games[index].price,
          ),
        ),
      );
    },
    child: Card(
      child: Row(
        children: [
          Image.network(
            "http://10.0.2.2:9090/img/" + _games[index].image,
            width: 220,
            height: 140,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _games[index].title,
              ),
              Text(
                _games[index].price.toString() + " TND",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    ),
  );
}
