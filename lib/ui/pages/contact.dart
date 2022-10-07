import 'package:flutter/material.dart';
import 'package:slothmute/ui/pages/api_animaux.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return const ApiParesseux();
  }
}
