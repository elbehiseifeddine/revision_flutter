import 'package:flutter/material.dart';
import 'package:rev/data/games.dart';
import 'package:rev/screens/component/game_card.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final List<Games> _games = [];

  @override
  void initState() {
    _games.add(Games(
        image: "assets/images/dmc5.jpg", title: "Devil May Cry 5", price: 200));
    _games.add(Games(
        image: "assets/images/re8.jpg",
        title: "Resident Evil VIII",
        price: 200));
    _games.add(Games(
        image: "assets/images/nfs.jpg",
        title: "Need For Speed Heat",
        price: 100));
    _games.add(Games(
        image: "assets/images/rdr2.jpg",
        title: "Red Dead Redemption II",
        price: 150));
    _games.add(
        Games(image: "assets/images/fifa.jpg", title: "FIFA 22", price: 100));
    _games.add(Games(
        image: "assets/images/minecraft.jpg", title: "Minecraft", price: 100));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _games.length,
      itemBuilder: (BuildContext context, int index) {
        return GameCard(index, _games);
      },
    );
  }
}
