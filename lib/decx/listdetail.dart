// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables, annotate_overrides, prefer_interpolation_to_compose_strings, unused_import, use_key_in_widget_constructors

// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../custom/custom.dart';
import 'list.dart';
import 'geturl.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class PokeApi {
  var types;
  var enName;
  var anoName;
  var genera;
  var abilities;
  var poImage;
  var pokedexnumbers;
  var entries;
  var stats;

  PokeApi(
      {required this.types,
      required this.enName,
      required this.anoName,
      required this.abilities,
      required this.poImage,
      required this.genera,
      required this.pokedexnumbers,
      required this.entries,
      required this.stats});

  factory PokeApi.fromJson(Map<String, dynamic> json) {
    return PokeApi(
      types: json['types'],
      enName: json['name'],
      abilities: json['abilities'],
      poImage: json['sprites'],
      anoName: json['names'],
      genera: json['genera'],
      pokedexnumbers: json['pokedex_numbers'],
      entries: json['flavor_text_entries'],
      stats: json['stats'],
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

Future<PokeApi> anoName() async {
  // 포켓몬 주소
  var response = await http.get(Uri.parse(detailDecx));

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
  late Future<PokeApi> anoname;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    anoname = anoName();
  }

// "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/1.png"),

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도감 디테일'),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
              child: SizedBox(
                width: 300,
                height: 200,
                child: Container(
                  child: SizedBox(
                    child: FutureBuilder<PokeApi>(
                      future: futureAlbum,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return FlutterCarousel(
                            options: CarouselOptions(
                              height: 400.0,
                              showIndicator: true,
                              slideIndicator: CircularSlideIndicator(),
                            ),
                            items: [
                              "front_default",
                              "front_shiny",
                            ].map((i) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    decoration: BoxDecoration(
                                        border: Border.all(),
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.white10),
                                    child: Image(
                                        image: NetworkImage(snapshot
                                            .data!.poImage["other"]["home"][i]
                                            .toString())),
                                  );
                                },
                              );
                            }).toList(),
                          );
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                  color: Colors.white12,
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
                            future: anoname,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Center(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text("이름 :         "),
                                      Column(
                                        children: [
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot.data!.enName.toString()),
                                          Text(snapshot.data!.anoName[0]["name"]
                                              .toString()),
                                          Text(snapshot.data!.anoName[2]["name"]
                                              .toString()),
                                        ],
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
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: FutureBuilder<PokeApi>(
                            future: anoname,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Center(
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                      ),
                                      Text("전국 도감 번호 :    "),
                                      Text(snapshot.data!
                                          .pokedexnumbers[0]["entry_number"]
                                          .toString()),
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
                          child: FutureBuilder<PokeApi>(
                            future: futureAlbum,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                            )),
                                        child: Row(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            SizedBox(
                                              width: 130,
                                            ),
                                            Text('종족값(base stats) : '),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    for (int i = 0;
                                        i < snapshot.data!.stats.length;
                                        i++)
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(snapshot
                                              .data!.stats[i]['stat']['name']
                                              .toString()),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Text(":  "),
                                          Text(snapshot
                                              .data!.stats[i]['base_stat']
                                              .toString()),
                                        ],
                                      )
                                  ],
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
                            future: anoname,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text('분류 : '),
                                    Text(snapshot.data!.genera[1]["genus"]
                                        .toString()),
                                  ],
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
                          child: FutureBuilder<PokeApi>(
                            future: anoname,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                            )),
                                        child: Row(
                                          // ignore: prefer_const_literals_to_create_immutables
                                          children: [
                                            SizedBox(
                                              width: 130,
                                            ),
                                            Text('도감설명 : '),
                                            SizedBox(
                                              height: 30,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    for (int i = 0;
                                        i < snapshot.data!.entries.length;
                                        i++)
                                      getKoEntries(
                                          snapshot.data!
                                              .entries[i]["language"]["name"]
                                              .toString(),
                                          context,
                                          snapshot.data!
                                              .entries[i]["version"]["name"]
                                              .toString(),
                                          snapshot
                                              .data!.entries[i]["flavor_text"]
                                              .toString())
                                  ],
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