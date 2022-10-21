import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:slothmute/ui/pages/contact.dart';

class Profile extends StatefulWidget {
  final Image image;
  final String name;

  const Profile({Key? key, required this.image, required this.name}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

   final _images = [
     Container(width: 100, height: 100, margin: const EdgeInsets.all(5), child: const Image(image: AssetImage("assets/images/sloth2.jpg"))),
     Container(width: 100, height: 100, margin: const EdgeInsets.all(5), child: const Image(image: AssetImage("assets/images/sloth2.jpg"))),
     Container(width: 100, height: 100, margin: const EdgeInsets.all(5), child: const Image(image: AssetImage("assets/images/sloth2.jpg"))),
     Container(width: 100, height: 100, margin: const EdgeInsets.all(5), child: const Image(image: AssetImage("assets/images/sloth2.jpg"))),
     Container(width: 100, height: 100, margin: const EdgeInsets.all(5), child: const Image(image: AssetImage("assets/images/sloth2.jpg"))),
     Container(width: 100, height: 100, margin: const EdgeInsets.all(5), child: const Image(image: AssetImage("assets/images/sloth2.jpg"))),
     Container(width: 100, height: 100, margin: const EdgeInsets.all(5), child: const Image(image: AssetImage("assets/images/sloth2.jpg"))),
     Container(width: 100, height: 100, margin: const EdgeInsets.all(5), child: const Image(image: AssetImage("assets/images/sloth2.jpg"))),
     Container(width: 100, height: 100, margin: const EdgeInsets.all(5), child: const Image(image: AssetImage("assets/images/sloth2.jpg")))
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        MaterialButton(onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Container(margin: const EdgeInsets.only(top: 20), child: const Icon(Icons.keyboard_return_rounded, size: 50))),
                        const Spacer(flex: 1)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(height: 50),
                        SizedBox(
                            width: 200,
                            height: 200,
                            child: ClipRRect(borderRadius: const BorderRadius.all(Radius.circular(100)), child: widget.image)
                        ),
                        Text(widget.name, style: const TextStyle(fontSize: 20, color: Colors.black, decoration: TextDecoration.none)),
                        Container(margin: const EdgeInsets.only(top: 10), child: const Text("Modifier mon profil", style: TextStyle(fontSize: 15, color: Colors.lightGreen, decoration: TextDecoration.none)))
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  const Text("Mes photos", style: TextStyle(color: Colors.black, fontSize: 20, decoration: TextDecoration.none)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: _images,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
