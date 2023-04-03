// ignore_for_file: prefer_const_constructors, annotate_overrides, unused_import, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_constructors_in_immutables, camel_case_types

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'listdetailjp.dart';
import 'dart:async';
import 'dart:convert';
import 'list.dart';
import 'listdetail.dart';

var detailDecx;
List<Sales> statlistjp = [];
List<Sales> statlist = [];

class testApi {
  var species;

  testApi({
    required this.species,
  });

  factory testApi.fromJson(Map<String, dynamic> json) {
    return testApi(
      species: json['species'],
    );
  }
}

Future<testApi> Decx() async {
  // 포켓몬 주소
  final response = await http.get(Uri.parse(nexturl));

  if (response.statusCode == 200) {
    return testApi.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load testApi');
  }
}

class getUrl extends StatefulWidget {
  getUrl({super.key});

  @override
  State<getUrl> createState() => _getUrlState();
}

class _getUrlState extends State<getUrl> {
  late Future<testApi> decx;

  @override
  void initState() {
    super.initState();

    decx = Decx();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg"),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FutureBuilder<testApi>(
              future: decx,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  // print(statlist);
                  return (ListView.builder(
                      itemCount: 1,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        dynamic decx = snapshot.data!.species["url"];

                        // dynamic detaildecx = snapshot.data!.species["url"];

                        return Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              color: Colors.white30,
                              child: ListTile(
                                leading: Text("도감 디테일 한국어 보기"),
                                trailing: IconButton(
                                  onPressed: () {
                                    detailDecx = decx;
                                    if (statlist != []) {
                                      statlist = [];
                                      statbase = [];
                                      statname = [];
                                    } else {
                                      statlist = [];
                                      statbase = [];
                                      statname = [];
                                    }

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Listdetail()),
                                    );
                                  },
                                  icon: Icon(Icons.home),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Card(
                              color: Colors.white30,
                              child: ListTile(
                                leading: Text("エントリーを日本語で見にいく"),
                                trailing: IconButton(
                                  onPressed: () {
                                    detailDecx = decx;
                                    if (statlistjp != []) {
                                      statlist = [];
                                      statbase = [];
                                      statname = [];
                                    } else {
                                      statlist = [];
                                      statbase = [];
                                      statname = [];
                                    }

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Listdetailjp()),
                                    );
                                  },
                                  icon: Icon(Icons.home),
                                ),
                              ),
                            ),
                          ],
                        );
                      }));
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
    );
  }
}

class Sales {
  String stat;
  int value;

  Sales(this.stat, this.value);
}
