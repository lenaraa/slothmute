import 'package:flutter/material.dart';

import '../../widgets/ContactWidget.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  static const List<ContactWidget> _contacts = <ContactWidget>[
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth4.jpg")),
        name: "Jean Guépard"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth1.jpg")),
        name: "Flash Slothmore"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth4.jpg")),
        name: "AlexSloth Sleepdt"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth3.jpg")),
        name: "Marie Paprécet"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth1.jpg")),
        name: "Jean Guépard"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth2.jpg")),
        name: "Flash Slothmore"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth4.jpg")),
        name: "AlexSloth Sleepdt"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth1.jpg")),
        name: "Marie Paprécet"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth2.jpg")),
        name: "Jean Guépard"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth3.jpg")),
        name: "Flash Slothmore"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth4.jpg")),
        name: "AlexSloth Sleepdt"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth2.jpg")),
        name: "Marie Paprécet"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth3.jpg")),
        name: "Jean Guépard"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth4.jpg")),
        name: "Flash Slothmore"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth2.jpg")),
        name: "AlexSloth Sleepdt"),
    ContactWidget(
        photo: Image(image: AssetImage("assets/images/sloth3.jpg")),
        name: "Marie Paprécet"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: <Widget>[
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
                    child: const Text(
                      "Mes amis",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                ],
              ),
            )),
        Expanded(
            flex: 9,
            child: Container(
                margin: const EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: _contacts),
                )))
      ],
    )));
  }
}
