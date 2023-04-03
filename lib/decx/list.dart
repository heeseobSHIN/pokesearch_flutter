// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, prefer_const_constructors_in_immutables, unused_element, dead_code, prefer_interpolation_to_compose_strings, annotate_overrides, prefer_typing_uninitialized_variables, unused_local_variable, sized_box_for_whitespace, non_constant_identifier_names, curly_braces_in_flow_control_structures
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokesearch/custom/test.dart';
import 'dart:async';
import 'dart:convert';
import 'geturl.dart';
import 'listdetail.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:page_transition/page_transition.dart';

var nexturl = "";
List<Listpo> getlist = [];
var getname = [];

class PokeApi1 {
  var results;

  PokeApi1({
    required this.results,
  });

  factory PokeApi1.fromJson(Map<String, dynamic> json) {
    return PokeApi1(
      results: json['results'],
    );
  }
}

Future<PokeApi1> fetchAlbum() async {
  // 포켓몬 주소
  final response = await http
      // .get(Uri.parse('https://pokeapi1.co/api/v2/pokemon/?limit=1010'));
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=0&limit=151'));

  if (response.statusCode == 200) {
    return PokeApi1.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokeApi1');
  }
}

class PokeApi2 {
  var results;

  PokeApi2({
    required this.results,
  });

  factory PokeApi2.fromJson(Map<String, dynamic> json) {
    return PokeApi2(
      results: json['results'],
    );
  }
}

Future<PokeApi2> poke2() async {
  // 포켓몬 주소
  final response = await http
      // .get(Uri.parse('https://pokeapi1.co/api/v2/pokemon/?limit=1010'));
      .get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=151&limit=100'));

  if (response.statusCode == 200) {
    return PokeApi2.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokeApi1');
  }
}

class PokeApi3 {
  var results;

  PokeApi3({
    required this.results,
  });

  factory PokeApi3.fromJson(Map<String, dynamic> json) {
    return PokeApi3(
      results: json['results'],
    );
  }
}

Future<PokeApi3> poke3() async {
  // 포켓몬 주소
  final response = await http
      // .get(Uri.parse('https://pokeapi1.co/api/v2/pokemon/?limit=1010'));
      .get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=251&limit=135'));

  if (response.statusCode == 200) {
    return PokeApi3.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokeApi1');
  }
}

class PokeApi4 {
  var results;

  PokeApi4({
    required this.results,
  });

  factory PokeApi4.fromJson(Map<String, dynamic> json) {
    return PokeApi4(
      results: json['results'],
    );
  }
}

Future<PokeApi4> poke4() async {
  // 포켓몬 주소
  final response = await http
      // .get(Uri.parse('https://pokeapi1.co/api/v2/pokemon/?limit=1010'));
      .get(
          Uri.parse('https://pokeapi.co/api/v2/pokemon/?offset=386&limit=107'));

  if (response.statusCode == 200) {
    return PokeApi4.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokeApi1');
  }
}

class PoketList extends StatefulWidget {
  PoketList({super.key});

  @override
  State<PoketList> createState() => _PoketListState();
}

class _PoketListState extends State<PoketList> {
  late Future<PokeApi1> futureAlbum;
  late Future<PokeApi2> futurepoke2;
  late Future<PokeApi3> futurepoke3;
  late Future<PokeApi4> futurepoke4;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    futurepoke2 = poke2();
    futurepoke3 = poke3();
    futurepoke4 = poke4();

    // futurepage = nextpage();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: PageView(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg"),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 50,
                          ),
                          Text("검색하기"),
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.topToBottom,
                                      child: ChartsDemo()));
                            },
                            icon: Icon(Icons.search),
                          ),
                        ],
                      ),
                      // child: Center(
                      //   child: TextField(
                      //     // onChanged: (value) => updateList(value),
                      //     decoration: InputDecoration(
                      //       hintText: '   探す1세대',
                      //       prefixIcon: Icon(Icons.search),
                      //       prefixIconColor: Colors.white,
                      //       filled: true,
                      //       fillColor: Color.fromARGB(255, 41, 40, 44),
                      //       border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(40.0),
                      //           borderSide: BorderSide.none),
                      //     ),
                      //   ),
                      // ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: FutureBuilder<PokeApi1>(
                        future: futureAlbum,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            for (int i = 0;
                                i < snapshot.data!.results.length;
                                i++)
                              getname.add(
                                  snapshot.data!.results[i]["name"].toString());

                            for (int i = 0;
                                i < snapshot.data!.results.length;
                                i++) {
                              getlist.add(Listpo(getname[i]
                                  .toString())); //근데 따로 안바꿔도 int형으로 들어갈 거에요
                            }
                            return (ListView.builder(
                                itemCount: snapshot.data!.results.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  dynamic pokename =
                                      snapshot.data!.results[index]["name"];
                                  dynamic pokedetail =
                                      snapshot.data!.results[index]["url"];
                                  // dynamic detaildecx = snapshot.data!.species["url"];

                                  return Card(
                                    color: Colors.white10,
                                    elevation: 0,
                                    child: ListTile(
                                      leading: Text(
                                          "ナンバー : " + (index + 1).toString()),
                                      trailing: IconButton(
                                        onPressed: () {
                                          nexturl = pokedetail;

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => getUrl()),
                                          );
                                        },
                                        icon: Icon(Icons.navigate_next),
                                      ),
                                      title: Center(
                                        child: Text(
                                          pokename.toString(),
                                        ),
                                      ),
                                    ),
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
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg"),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: TextField(
                          // onChanged: (value) => updateList(value),
                          decoration: InputDecoration(
                            hintText: '   探す2세대',
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Colors.white,
                            filled: true,
                            fillColor: Color.fromARGB(255, 41, 40, 44),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: FutureBuilder<PokeApi2>(
                        future: futurepoke2,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return (ListView.builder(
                                itemCount: snapshot.data!.results.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  dynamic pokename =
                                      snapshot.data!.results[index]["name"];
                                  dynamic pokedetail =
                                      snapshot.data!.results[index]["url"];
                                  // dynamic detaildecx = snapshot.data!.species["url"];

                                  return Card(
                                    color: Colors.white10,
                                    elevation: 0,
                                    child: ListTile(
                                      leading: Text(
                                          "ナンバー : " + (index + 152).toString()),
                                      trailing: IconButton(
                                        onPressed: () {
                                          nexturl = pokedetail;

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => getUrl()),
                                          );
                                        },
                                        icon: Icon(Icons.navigate_next),
                                      ),
                                      title: Center(
                                        child: Text(
                                          pokename.toString(),
                                        ),
                                      ),
                                    ),
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
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg"),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: TextField(
                          // onChanged: (value) => updateList(value),
                          decoration: InputDecoration(
                            hintText: '   探す3세대',
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Colors.white,
                            filled: true,
                            fillColor: Color.fromARGB(255, 41, 40, 44),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: FutureBuilder<PokeApi3>(
                        future: futurepoke3,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return (ListView.builder(
                                itemCount: snapshot.data!.results.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  dynamic pokename =
                                      snapshot.data!.results[index]["name"];
                                  dynamic pokedetail =
                                      snapshot.data!.results[index]["url"];
                                  // dynamic detaildecx = snapshot.data!.species["url"];

                                  return Card(
                                    color: Colors.white10,
                                    elevation: 0,
                                    child: ListTile(
                                      leading: Text(
                                          "ナンバー : " + (index + 252).toString()),
                                      trailing: IconButton(
                                        onPressed: () {
                                          nexturl = pokedetail;

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => getUrl()),
                                          );
                                        },
                                        icon: Icon(Icons.navigate_next),
                                      ),
                                      title: Center(
                                        child: Text(
                                          pokename.toString(),
                                        ),
                                      ),
                                    ),
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
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg"),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: TextField(
                          // onChanged: (value) => updateList(value),
                          decoration: InputDecoration(
                            hintText: '   名前とナンバーを通して探す4',
                            prefixIcon: Icon(Icons.search),
                            prefixIconColor: Colors.white,
                            filled: true,
                            fillColor: Color.fromARGB(255, 41, 40, 44),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0),
                                borderSide: BorderSide.none),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.9,
                      child: FutureBuilder<PokeApi4>(
                        future: futurepoke4,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return (ListView.builder(
                                itemCount: snapshot.data!.results.length,
                                scrollDirection: Axis.vertical,
                                itemBuilder: (context, index) {
                                  dynamic pokename =
                                      snapshot.data!.results[index]["name"];
                                  dynamic pokedetail =
                                      snapshot.data!.results[index]["url"];
                                  // dynamic detaildecx = snapshot.data!.species["url"];

                                  return Card(
                                    color: Colors.white10,
                                    elevation: 0,
                                    child: ListTile(
                                      leading: Text(
                                          "ナンバー : " + (index + 387).toString()),
                                      trailing: IconButton(
                                        onPressed: () {
                                          nexturl = pokedetail;

                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => getUrl()),
                                          );
                                        },
                                        icon: Icon(Icons.navigate_next),
                                      ),
                                      title: Center(
                                        child: Text(
                                          pokename.toString(),
                                        ),
                                      ),
                                    ),
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Listpo {
  String name;

  Listpo(
    this.name,
  );
}
