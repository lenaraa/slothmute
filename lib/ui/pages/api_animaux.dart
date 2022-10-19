import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiParesseux extends StatefulWidget {
  const ApiParesseux({super.key});

  @override
  State<ApiParesseux> createState() => _ApiParesseuxState();
}

class _ApiParesseuxState extends State<ApiParesseux> {
  List<String> _animaux = [];

  Future<String> _getAnimaux() async {
    var url = Uri.parse('https://zoo-animal-api.herokuapp.com/animals/rand/10');

    var request = await http.get(url);
    if (request.statusCode == 200) {
      return request.body;
    } else {
      return "has error";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAnimaux(),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Text(snapshot.data!);
            } else {
              return const Text('pas de data ');
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
