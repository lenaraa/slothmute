import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  final String name;
  final String message;
  final Image photo;

  const Message({Key? key, required this.name, required this.message, required this.photo}) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 70,
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Text(widget.name),
                    Expanded(flex: 1, child: ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
                      child: Container(
                        width: double.maxFinite,
                        color: Colors.green.shade200,
                        padding: const EdgeInsets.all(10),
                        child: Text(widget.message),
                      ),
                    ))
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                      child: widget.photo
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
