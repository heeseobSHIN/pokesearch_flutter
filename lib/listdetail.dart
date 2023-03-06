// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, annotate_overrides, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class PokeApi {
  var types;
  var name;

  PokeApi({
    required this.types,
    required this.name,
  });

  factory PokeApi.fromJson(Map<String, dynamic> json) {
    return PokeApi(
      types: json['types'],
      name: json['name'],
    );
  }
}

Future<PokeApi> fetchAlbum() async {
  // 포켓몬 주소
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/1/'));

  if (response.statusCode == 200) {
    return PokeApi.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokeApi');
  }
}

class Listdetail extends StatefulWidget {
  Listdetail({super.key});

  @override
  State<Listdetail> createState() => _ListdetailState();
}

class _ListdetailState extends State<Listdetail> {
  late Future<PokeApi> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    // futurepage = nextpage();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도감 디테일'),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SizedBox(
                width: 300,
                height: 200,
                child: PageView(
                  children: [
                    Container(
                        child: Image(
                      image: NetworkImage(
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png"),
                    )),
                    Container(
                      child: Icon(
                        Icons.square,
                        size: 150,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.square,
                        size: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: FutureBuilder<PokeApi>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Center(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text(snapshot.data!.name.toString()),
                                    ],
                                  ),
                                );
                                //return Text(snapshot.data!.types[0].toString());
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              // By default, show a loading spinner.
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: ListTile(
                          leading: Text('도감번호'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: ListTile(
                          leading: Text('발자국, 성별,'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: FutureBuilder<PokeApi>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Center(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text('타입 1 : '),
                                      Text(
                                        snapshot.data!.types[0]["type"]["name"]
                                                .toString() +
                                            "   ,  ",
                                      ),
                                      Text('타입 2 : '),
                                      Text(
                                        snapshot.data!.types[1]["type"]["name"]
                                            .toString(),
                                      ),
                                    ],
                                  ),
                                );
                                //return Text(snapshot.data!.types[0].toString());
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              // By default, show a loading spinner.
                              return Center(child: CircularProgressIndicator());
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: ListTile(
                          leading: Text('진화정보'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: ListTile(
                          leading: Text('도감설명'),
                        ),
                      ),
                    ),
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
