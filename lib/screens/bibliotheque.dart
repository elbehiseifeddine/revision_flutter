import 'package:flutter/material.dart';
import 'package:rev/data/games.dart';
import 'package:rev/screens/component/bibliotheque_game_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Bibliotheque extends StatefulWidget {
  const Bibliotheque({Key? key}) : super(key: key);

  @override
  _BibliothequeState createState() => _BibliothequeState();
}

class _BibliothequeState extends State<Bibliotheque> {
  final List<Games> _games = [];

  final String _baseUrl = "10.0.2.2:9090";
  late Future<bool> fetchedGames;

  Future<bool> fetchGames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    http.Response response = await http
        .get(Uri.http(_baseUrl, "/library/" + prefs.getString("userId")!));

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
          return GridView.builder(
            itemCount: _games.length,
            itemBuilder: (BuildContext context, int index) {
              return BibliothequeGameCard(
                  _games[index].image, _games[index].title);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
                mainAxisExtent: 130),
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
