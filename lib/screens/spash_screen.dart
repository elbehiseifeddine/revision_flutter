import 'package:flutter/material.dart';
import 'package:rev/screens/navbar_holder.dart';
import 'package:rev/screens/signin_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({Key? key}) : super(key: key);

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  late Future<bool> _session;
  late String route;
  bool isLoading = false;
  Future<bool> _verifySession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.remove("userId");

    if (prefs.containsKey("userId")) {
      route = "/navbar";
    } else {
      route = "/signIn";
    }
    return true;
  }

  @override
  void initState() {
    _session = _verifySession();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _session,
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("G-Store ESPRIT"),
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (route == "/navbar") {
            return const NavBar();
          } else {
            return const Signin();
          }
        }
      },
    );
  }
}
