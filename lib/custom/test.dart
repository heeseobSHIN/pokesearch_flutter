// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pokesearch/decx/geturl.dart';
import 'package:pokesearch/decx/list.dart';
import 'package:searchable_listview/searchable_listview.dart';

void main() {
  runApp(const ChartsDemo());
}

class ChartsDemo extends StatelessWidget {
  const ChartsDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Scaffold(
        body: SafeArea(
          child: ExampleApp(),
        ),
      ),
    );
  }
}

class ExampleApp extends StatefulWidget {
  const ExampleApp({Key? key}) : super(key: key);

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg"),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SearchableList<Listpo>(
                  style: const TextStyle(fontSize: 25),
                  onPaginate: () async {
                    await Future.delayed(const Duration(milliseconds: 1000));
                  },
                  builder: (Listpo name) => ActorItem(name: name),
                  loadingWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Loading actors...')
                    ],
                  ),
                  errorWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Error while fetching actors')
                    ],
                  ),
                  asyncListCallback: () async {
                    await Future.delayed(
                      const Duration(
                        milliseconds: 1000,
                      ),
                    );
                    return getlist;
                  },
                  asyncListFilter: (q, list) {
                    return list
                        .where((element) => element.name.contains(q))
                        .toList();
                  },
                  emptyWidget: const EmptyView(),
                  onRefresh: () async {},
                  onItemSelected: (Listpo item) {},
                  inputDecoration: InputDecoration(
                    labelText: "Search Pokemon",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActorItem extends StatelessWidget {
  final Listpo name;

  const ActorItem({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Colors.white30,
        child: ListTile(
          trailing: IconButton(
            icon: Icon(Icons.navigate_next),
            onPressed: () {
              nexturl = name.url;
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => getUrl()));
            },
          ),
          leading: Text(
            ' ${name.name}',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      //-------------------------------------------------------------------//
      // child: Container(
      //   height: 60,
      //   decoration: BoxDecoration(
      //     color: Colors.grey[200],
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   child: Row(
      //     children: [
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       Icon(
      //         Icons.star,
      //         color: Colors.yellow[700],
      //       ),
      //       const SizedBox(
      //         width: 10,
      //       ),
      //       Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           Text(
      //             ' ${name.name}',
      //             style: const TextStyle(
      //               color: Colors.black,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ],
      //       ),
      //       IconButton(
      //         onPressed: () {},
      //         icon: Icon(Icons.navigate_next),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('no actor is found with this name'),
      ],
    );
  }
}

class Actor {
  int age;
  String name;
  String lastName;

  Actor({
    required this.age,
    required this.name,
    required this.lastName,
  });
}
