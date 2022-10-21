import 'package:flutter/material.dart';
import 'package:slothmute/widgets/Message.dart';

class Messagerie extends StatefulWidget {
  final String? name;

  const Messagerie({Key? key, this.name}) : super(key: key);

  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  final List<Widget> _messages = [
    const Message(
        name: "Alexsloth Sleepdt",
        message: "Yo les gars, le prof a fait l'appel aujourd'hui ?",
        photo: Image(image: AssetImage("assets/images/sloth2.jpg"))),
    const Message(
        name: "Sarah Croche",
        message: "T'es dans la merde Sleepdt, t'as pas mis ton réveil encore ?",
        photo: Image(image: AssetImage("assets/images/sloth3.jpg"))),
    const Message(
        name: "Flash Slothmore",
        message: "mdr t viré bro",
        photo: Image(image: AssetImage("assets/images/sloth1.jpg"))),
    const Message(
        name: "Flash Slothmore",
        message: "viré mon gars",
        photo: Image(image: AssetImage("assets/images/sloth1.jpg"))),
    const Message(
        name: "Flash Slothmore",
        message: "viré mon gars",
        photo: Image(image: AssetImage("assets/images/sloth1.jpg"))),
    const Message(
        name: "Flash Slothmore",
        message: "viré mon gars",
        photo: Image(image: AssetImage("assets/images/sloth1.jpg"))),
    const Message(
        name: "Alexsloth Sleepdt",
        message: "tg toi",
        photo: Image(image: AssetImage("assets/images/sloth2.jpg"))),
    const Message(
        name: "Alexsloth Sleepdt",
        message: "nop pas mis mon réveil",
        photo: Image(image: AssetImage("assets/images/sloth2.jpg"))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Container(
                color: Colors.green.shade900,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1, child: Icon(Icons.group, color: Colors.white)),
                    Expanded(
                        flex: 2,
                        child: Text(
                          widget.name ?? "SlothTeam",
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500),
                        )),
                    Container(
                        width: 70,
                        margin: const EdgeInsets.only(right: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            color: Colors.green.shade600,
                            padding: const EdgeInsets.all(5),
                            child: Row(
                              children: const [
                                Icon(Icons.call, color: Colors.black),
                                SizedBox(width: 10),
                                Icon(Icons.video_call, color: Colors.black)
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                  width: double.infinity,
                  color: Colors.green.shade500,
                  child: SingleChildScrollView(
                      reverse: true,
                      child: Column(
                        children: _messages,
                      ))),
            ),
            SizedBox(
              height: 60,
              child: Container(
                color: Colors.green.shade900,
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Icon(Icons.camera_alt_rounded,
                            color: Colors.white)),
                    Expanded(
                      flex: 3,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                        child: Container(
                          height: 40,
                          color: Colors.green.shade500,
                          child: const TextField(textAlign: TextAlign.center),
                        ),
                      ),
                    ),
                    const Spacer(flex: 1)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
