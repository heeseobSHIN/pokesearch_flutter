// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, prefer_const_constructors_in_immutables, unused_element, dead_code, prefer_interpolation_to_compose_strings, annotate_overrides, prefer_typing_uninitialized_variables, unused_local_variable, sized_box_for_whitespace, non_constant_identifier_names
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'geturl.dart';
import 'listdetail.dart';

var nexturl = "";

class PokeApi {
  var results;

  PokeApi({
    required this.results,
  });

  factory PokeApi.fromJson(Map<String, dynamic> json) {
    return PokeApi(
      results: json['results'],
    );
  }
}

Future<PokeApi> fetchAlbum() async {
  // 포켓몬 주소
  final response = await http
      // .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=1010'));
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=898'));

  if (response.statusCode == 200) {
    return PokeApi.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load pokeApi');
  }
}

// Future<PokeApi> Decx() async {
//   // 포켓몬 주소
//   final response = await http.get(Uri.parse(nexturl));

//   if (response.statusCode == 200) {
//     return PokeApi.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load pokeApi');
//   }
// }

class PoketList extends StatefulWidget {
  PoketList({super.key});

  @override
  State<PoketList> createState() => _PoketListState();
}

class _PoketListState extends State<PoketList> {
  late Future<PokeApi> futureAlbum;
  late Future<PokeApi> futurepage;
  late Future<PokeApi> decx;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();

    // futurepage = nextpage();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
                child: Center(
                  child: TextField(
                    // onChanged: (value) => updateList(value),
                    decoration: InputDecoration(
                      hintText: '   名前とナンバーを通して探す',
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
                child: FutureBuilder<PokeApi>(
                  future: futureAlbum,
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
                              child: ListTile(
                                //   title: Text('일러'),
                                leading:
                                    Text("ナンバー : " + (index + 1).toString()),
                                trailing: IconButton(
                                  onPressed: () {
                                    nexturl = pokedetail;
                                    // detailDecx = detaildecx;
                                    // print(nexturl);
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
                                // subtitle: Center(
                                //   child: FutureBuilder<PokeApi>(
                                //     future: decx,
                                //     builder: (context, snapshot) {
                                //       if (snapshot.hasData) {
                                //         return (detailDecx =
                                //             snapshot.data!.species["url"]);
                                //         //return Text(snapshot.data!.results[0].toString());
                                //       } else if (snapshot.hasError) {
                                //         return Text('${snapshot.error}');
                                //       }

                                //       // By default, show a loading spinner.
                                //       return Center(
                                //           child: CircularProgressIndicator());
                                //     },
                                //   ),
                                // ),
                              ),
                            );
                          }));
                      //return Text(snapshot.data!.results[0].toString());
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
    );
  }
}
