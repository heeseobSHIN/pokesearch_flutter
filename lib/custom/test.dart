import 'dart:async';

import 'package:flutter/material.dart';
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
        primarySwatch: Colors.blue,
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
  final List<Actor> actors = [
    Actor(age: 47, name: 'Leonardo', lastName: 'DiCaprio'),
    Actor(age: 58, name: 'Johnny', lastName: 'Depp'),
    Actor(age: 78, name: 'Robert', lastName: 'De Niro'),
    Actor(age: 44, name: 'Tom', lastName: 'Hardy'),
    Actor(age: 66, name: 'Denzel', lastName: 'Washington'),
    Actor(age: 49, name: 'Ben', lastName: 'Affleck'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Text('Searchable list with divider'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SearchableList<Listpo>(
                style: const TextStyle(fontSize: 25),
                onPaginate: () async {
                  await Future.delayed(const Duration(milliseconds: 1000));
                  // setState(() {
                  //   actors.addAll([
                  //     Actor(age: 22, name: 'Fathi', lastName: 'Hadawi'),
                  //     Actor(age: 22, name: 'Hichem', lastName: 'Rostom'),
                  //     Actor(age: 22, name: 'Kamel', lastName: 'Twati'),
                  //   ]);
                  // });
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
                  labelText: "Search Actor",
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                secondaryWidget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    color: Colors.grey[400],
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Center(
                        child: Icon(Icons.sort),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.center,
          //   child: ElevatedButton(
          //     onPressed: addActor,
          //     child: const Text('Add actor'),
          //   ),
          // )
        ],
      ),
    );
  }

  // void addActor() {
  //   actors.add(Actor(
  //     age: 10,
  //     lastName: 'Ali',
  //     name: 'ALi',
  //   ));
  //   setState(() {});
  // }
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
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.star,
              color: Colors.yellow[700],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Firstname: ${name.name}',
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   'Lastname: ${name.name}',
                //   style: const TextStyle(
                //     color: Colors.black,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // Text(
                //   'Age: ${actor.age}',
                //   style: const TextStyle(
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
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
