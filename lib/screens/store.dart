import 'package:flutter/material.dart';
import 'package:rev/data/games.dart';
import 'package:rev/screens/component/game_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Store extends StatefulWidget {
  const Store({Key? key}) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  final List<Games> _games = [];

  final String _baseUrl = "10.0.2.2:9090";
  late Future<bool> fetchedGames;

  Future<bool> fetchGames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    http.Response response = await http.get(Uri.http(_baseUrl, "/game"));

    List<dynamic> gamesFromServer = json.decode(response.body);

    for (int i = 0; i < gamesFromServer.length; i++) {
      Map<String, dynamic> gameFromServer = gamesFromServer[i];
      _games.add(Games(
          image: gameFromServer["image"],
          title: gameFromServer["title"],
          description: gameFromServer["description"],
          price: int.parse(gameFromServer["price"].toString()),
          quantity: int.parse(gameFromServer["quantity"].toString())));
    }

    return true;
  }

  @override
  void initState() {
    fetchedGames = fetchGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchedGames,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: _games.length,
            itemBuilder: (BuildContext context, int index) {
              return GameCard(index, _games, context);
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
