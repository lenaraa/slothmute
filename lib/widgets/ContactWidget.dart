import 'package:flutter/material.dart';

class ContactWidget extends StatefulWidget {
  const ContactWidget(this.photo, this.name, {super.key});

  final Image photo;
  final String name;

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: Image(image: widget.photo.image, width: 50, height: 50),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Text(widget.name),
          ),
          const Spacer(flex: 1),
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(
              Icons.camera_alt_rounded,
              color: Colors.lightGreen,
            )
          ),
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: const Icon(
              Icons.message_outlined,
              color: Colors.lightGreen,
            ),
          )
        ],
      ),
    );
  }
}
