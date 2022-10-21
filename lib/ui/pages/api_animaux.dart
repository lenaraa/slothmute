import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:slothmute/data/SlothData.dart';

class ApiParesseux extends StatefulWidget {
  const ApiParesseux({super.key});

  @override
  State<ApiParesseux> createState() => _ApiParesseuxState();
}

class _ApiParesseuxState extends State<ApiParesseux> {
  List<String> _animaux = [];

  Future<List<SlothData>> _getAnimaux() async {
    var url = Uri.parse('https://zoo-animal-api.herokuapp.com/animals/rand/10');

    var request = await http.get(url);
    if (request.statusCode == 200) {
      Iterable values = jsonDecode(request.body);
      return List<SlothData>.from(values.map((e) {
        return SlothData.fromJson(e);
      }));
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getAnimaux(),
        builder:
            (BuildContext context, AsyncSnapshot<List<SlothData>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return SafeArea(
                  child: Column(
                    children: [
                      const Text("https://zoo-animal-api.herokuapp.com/animals/rand/10", style: TextStyle(fontSize: 20)),
                      Expanded(
                        flex: 1,
                        child: ListView.separated(
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Row(
                                  children: [
                                    Image.network(snapshot.data![index].imageLink, width: 70, height: 70, errorBuilder: (context, object, err) {
                                      return const SizedBox(width: 70, height: 70);
                                    }),
                                    const SizedBox(width: 20),
                                    Text(snapshot.data![index].name)
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => const Divider(),
                            itemCount: snapshot.data!.length),
                      )
                    ],
                  ));
            } else {
              return const Text('pas de data ');
            }
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
