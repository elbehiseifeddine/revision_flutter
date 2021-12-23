import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();

  late String _username;
  late String _password;
  late String _email;
  late String _naissance;
  late String _adresse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inscription"),
      ),
      body: Form(
        key: _keyForm,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Image.asset(
                "assets/images/minecraft.jpg",
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                ),
                onSaved: (String? value) {
                  _username = value.toString();
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Username ne doit pas etre vide";
                  } else if (value.length < 5) {
                    return "Username doit avoir au moins 5 caractères";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email",
                ),
                onSaved: (String? value) {
                  _email = value.toString();
                },
                validator: (String? value) {
                  String pattern =
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                  if (value == null || value.isEmpty) {
                    return "Email ne doit pas etre vide";
                  } else if (!RegExp(pattern).hasMatch(value)) {
                    return "Email incorrect";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 15.0,
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Mot de passe",
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Icon(
                      Icons.lock,
                    ),
                  ),
                ),
                onSaved: (String? value) {
                  _password = value.toString();
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Le mot de passe ne doit pas etre vide";
                  } else if (value.length < 5) {
                    return "Le mot de passe doit avoir au moins 5 caractères";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Naissance",
                ),
                onSaved: (String? value) {
                  _naissance = value.toString();
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Naissance ne doit pas etre vide";
                  } else if (value.length != 10) {
                    return "Naissance doit avoir au moins 10 caractères";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Adresse",
                ),
                onSaved: (String? value) {
                  _adresse = value.toString();
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Adresse ne doit pas etre vide";
                  } else if (value.length < 5) {
                    return "Adresse doit avoir au moins 5 caractères";
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) {
                        _keyForm.currentState!.save();
                        Navigator.pushReplacementNamed(context, '/navbar');
                      }
                    },
                    child: const Text(
                      "S'inscrire",
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "Annuler",
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
