// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, annotate_overrides, prefer_interpolation_to_compose_strings, unused_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'list.dart';

class PokeApi {
  var types;
  var name;
  var abilities;
  var poImage;

  PokeApi({
    required this.types,
    required this.name,
    required this.abilities,
    required this.poImage,
  });

  factory PokeApi.fromJson(Map<String, dynamic> json) {
    return PokeApi(
      types: json['types'],
      name: json['name'],
      abilities: json['abilities'],
      poImage: json['sprites'],
    );
  }
}

Future<PokeApi> fetchAlbum() async {
  // 포켓몬 주소
  var response = await http.get(Uri.parse(nexturl));

  if (response.statusCode == 200) {
    return PokeApi.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokeApi');
  }
}

class Listdetail extends StatefulWidget {
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

// "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png"),

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
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: SizedBox(
                width: 300,
                height: 200,
                child: PageView(
                  children: [
                    Container(
                      child: SizedBox(
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
                                    Image(
                                        image: NetworkImage(snapshot
                                            .data!
                                            .poImage["other"]["home"]
                                                ["front_default"]
                                            .toString())),
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
                    Container(
                      child: SizedBox(
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
                                    Image(
                                        image: NetworkImage(snapshot
                                            .data!
                                            .poImage["other"]["home"]
                                                ["front_shiny"]
                                            .toString())),
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
                    Container(
                      child: SizedBox(
                        child: FutureBuilder<PokeApi>(
                          future: futureAlbum,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return Center(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 70,
                                    ),
                                    Image(
                                        image: NetworkImage(snapshot
                                            .data!.poImage["back_default"]
                                            .toString())),
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
                          height: MediaQuery.of(context).size.height * 0.07,
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
                                      Text("이름 : "),
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
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 50,
                              ),
                              Text("도감 번호 : "),
                              Text(nexturl
                                  .substring(34, nexturl.lastIndexOf("/"))
                                  .toString()),
                            ],
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
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
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

                                      (() {
                                        if (snapshot.data!.abilities.length ==
                                            2) {
                                          return Row(
                                            children: [
                                              Text('특성1 : '),
                                              Text(
                                                snapshot
                                                        .data!
                                                        .abilities[0]["ability"]
                                                            ["name"]
                                                        .toString() +
                                                    "   ,  ",
                                              ),
                                              Text('특성2 : '),
                                              Text(snapshot
                                                  .data!
                                                  .abilities[1]["ability"]
                                                      ["name"]
                                                  .toString()),
                                            ],
                                          );
                                        } else {
                                          return Row(
                                            children: [
                                              Text('단일 특성 : '),
                                              Text(snapshot
                                                  .data!
                                                  .abilities[0]["ability"]
                                                      ["name"]
                                                  .toString()),
                                            ],
                                          );
                                        }
                                      })(),

                                      // if (snapshot.data!.abilities.length >= 2){
                                      // return Text(snapshot
                                      //     .data!.abilities[1]["ability"]["name"]
                                      //     .toString());}
                                      //     else {
                                      //       return Text();
                                      //     };
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
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: FutureBuilder<PokeApi>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Center(
                                  child: (() {
                                    if (snapshot.data!.types.length == 2) {
                                      return Row(
                                        children: [
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text('타입1 : '),
                                          Text(
                                            snapshot.data!
                                                    .types[0]["type"]["name"]
                                                    .toString() +
                                                "   ,  ",
                                          ),
                                          Text('타입2 : '),
                                          Text(
                                            snapshot
                                                .data!.types[1]["type"]["name"]
                                                .toString(),
                                          ),
                                        ],
                                      );
                                    } else {
                                      return Row(
                                        children: [
                                          SizedBox(
                                            width: 50,
                                          ),
                                          Text('단일 타입 : '),
                                          Text(
                                            snapshot
                                                .data!.types[0]["type"]["name"]
                                                .toString(),
                                          ),
                                        ],
                                      );
                                    }
                                  })(),
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
