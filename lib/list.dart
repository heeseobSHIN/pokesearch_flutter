// ignore_for_file: prefer_const_constructors, unused_import, avoid_print, prefer_const_constructors_in_immutables, unused_element, dead_code, prefer_interpolation_to_compose_strings, annotate_overrides, prefer_typing_uninitialized_variables, unused_local_variable
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

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
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon/?limit=1279'));

  if (response.statusCode == 200) {
    return PokeApi.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class PoketList extends StatefulWidget {
  PoketList({super.key});

  @override
  State<PoketList> createState() => _PoketListState();
}

class _PoketListState extends State<PoketList> {
  late Future<PokeApi> futureAlbum;
  late Future<PokeApi> futurepage;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    // futurepage = nextpage();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('검색'),
        elevation: 0,
        leading: Icon(Icons.search),
      ),
      body: FutureBuilder<PokeApi>(
        future: futureAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return (ListView.builder(
                itemCount: snapshot.data!.results.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  dynamic pokename = snapshot.data!.results[index]["name"];
                  dynamic pokedetail = snapshot.data!.results[index]["url"];
                  return Card(
                    child: ListTile(
                      //   title: Text('일러'),
                      leading: Text("사진"),
                      trailing: Text('타입아이콘'),
                      title: Center(
                        child: Text(
                          pokename.toString(),
                        ),
                      ),
                    ),
                  );
                }));
            //return Text(snapshot.data!.results[0].toString());
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
