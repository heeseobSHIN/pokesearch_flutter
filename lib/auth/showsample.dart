// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, deprecated_member_use, unused_local_variable, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, constant_identifier_names, unnecessary_import, sort_child_properties_last, unused_element

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokesearch/auth/updatemysample.dart';
import 'package:pokesearch/custom/custom.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:url_launcher/link.dart';
import 'package:flutter/services.dart';
import '../custom/getsampleDoc.dart';
import 'signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
var reason;
var h;
var a;
var b;
var c;
var d;
var s;
var stat;
var mainsk;
var subsk;

class Showsm extends StatefulWidget {
  const Showsm({super.key});

  @override
  State<Showsm> createState() => _ShowsmState();
}

class _ShowsmState extends State<Showsm> {
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    if (db.collection("mysample").doc(samname) != null) {
      final docRef = db.collection("mysample").doc(samname);
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;

          reason = data["reason"];
          h = data["h"];
          a = data["a"];
          b = data["b"];
          c = data["c"];
          d = data["d"];
          s = data["s"];
          stat = data["성격"];
          mainsk = data["주기술"];
          subsk = data["후보기술"];
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } else {
      Toast.show("데이터가 없습니다.", duration: Toast.lengthShort, gravity: Toast.top);
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text('샘플 보기'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
            image: NetworkImage(
              "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg",
            ),
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                FutureBuilder(
                    future: _reason(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData == false) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      } else {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 100,
                                ),
                                Text("노력치 조정 목적 :    "),
                                Text(
                                  snapshot.data.toString(),
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white12,
                              border: Border.all(),
                            ),
                          ),
                        );
                      }
                    }),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text("노력치 :    "),
                        SizedBox(
                          height: 20,
                        ),
                        FutureBuilder(
                            future: _h(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Error: ${snapshot.error}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text("h :    "),
                                      Text(
                                        snapshot.data.toString(),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }),
                        FutureBuilder(
                            future: _a(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Error: ${snapshot.error}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text("a :    "),
                                      Text(
                                        snapshot.data.toString(),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }),
                        FutureBuilder(
                            future: _b(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Error: ${snapshot.error}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text("b :    "),
                                      Text(
                                        snapshot.data.toString(),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }),
                        FutureBuilder(
                            future: _c(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Error: ${snapshot.error}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text("c :    "),
                                      Text(
                                        snapshot.data.toString(),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }),
                        FutureBuilder(
                            future: _d(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Error: ${snapshot.error}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text("d :    "),
                                      Text(
                                        snapshot.data.toString(),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }),
                        FutureBuilder(
                            future: _s(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData == false) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'Error: ${snapshot.error}',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Text("s :    "),
                                      Text(
                                        snapshot.data.toString(),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            }),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.white12,
                      border: Border.all(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    child: FutureBuilder(
                        future: _stat(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData == false) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Error: ${snapshot.error}',
                                style: TextStyle(fontSize: 15),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text("성격 :    "),
                                  Text(
                                    snapshot.data.toString(),
                                  ),
                                ],
                              ),
                            );
                          }
                        }),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.white12,
                      border: Border.all(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: Container(
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text("기술배치 :   "),
                          SizedBox(
                            height: 20,
                          ),
                          FutureBuilder(
                              future: _mainsk(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData == false) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Error: ${snapshot.error}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Text("주기술 :    "),
                                        Text(
                                          snapshot.data.toString(),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }),
                          FutureBuilder(
                              future: _subsk(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                                if (snapshot.hasData == false) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Error: ${snapshot.error}',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 8.0),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 100,
                                        ),
                                        Text("후보기술 : "),
                                        Text(
                                          snapshot.data.toString(),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              }),
                        ],
                      ),
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.white12,
                      border: Border.all(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<String> _reason() async {
  await Future.delayed(Duration(seconds: 2));
  return reason;
}

Future<String> _h() async {
  await Future.delayed(Duration(seconds: 2));
  return h;
}

Future<String> _a() async {
  await Future.delayed(Duration(seconds: 2));
  return a;
}

Future<String> _b() async {
  await Future.delayed(Duration(seconds: 2));
  return b;
}

Future<String> _c() async {
  await Future.delayed(Duration(seconds: 2));
  return c;
}

Future<String> _d() async {
  await Future.delayed(Duration(seconds: 2));
  return d;
}

Future<String> _s() async {
  await Future.delayed(Duration(seconds: 2));
  return s;
}

Future<String> _stat() async {
  await Future.delayed(Duration(seconds: 2));
  return stat;
}

Future<String> _mainsk() async {
  await Future.delayed(Duration(seconds: 2));
  return mainsk;
}

Future<String> _subsk() async {
  await Future.delayed(Duration(seconds: 2));
  return subsk;
}
