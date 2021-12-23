import 'package:flutter/material.dart';
import 'package:rev/data/games.dart';

GestureDetector GameCard(int index, List<Games> _games) {
  return GestureDetector(
    onTap: () {},
    child: Card(
      child: Row(
        children: [
          Image.asset(
            _games[index].image,
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
