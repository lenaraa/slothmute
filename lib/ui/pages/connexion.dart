import 'package:flutter/material.dart';

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.0,
                  0.4,
                  0.8,
                ],
                colors: <Color>[
                  Colors.lightGreen.shade600,
                  Colors.lightGreen.shade400,
                  Colors.lightGreen.shade600,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 180.0,
                  width: 180.0,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fill, image: AssetImage("assets/logo.png")),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: const Text(
                    "Bienvenue sur SlothMute, connectez-vous !",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              child: ListView(
                children: [
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? 'enter an email' : null,
                  ),
                  const SizedBox(height: 11),
                  TextFormField(
                    obscureText: true,
                    validator: (value) => value!.length < 6
                        ? 'mettez au moins un mot de passe a 6 caractères'
                        : null,
                  ),
                  TextButton(
                    onPressed: () async {},
                    child: const Text(''),
                  ),
                  SizedBox(
                    child: TextButton(
                        child: const Text(
                          'mot de passe oublié',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        onPressed: () {}),
                  ),
                  SizedBox(
                    height: 35,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Inscrivez-vous ici!',
                        style: TextStyle(
                          color: Colors.lightGreen.shade600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
