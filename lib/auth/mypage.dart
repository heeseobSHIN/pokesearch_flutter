// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, deprecated_member_use, unused_local_variable, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokesearch/custom/custom.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:url_launcher/link.dart';
import 'package:flutter/services.dart';
import 'updatemysample.dart';
import 'signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
String? userEmail;

var region;
var mypo;
var imageUrl;

final Uri _url = Uri.parse('https://tiredhermitcrab.github.io/SimplePokeCalc/');
// FirebaseDatabase database = FirebaseDatabase.instance;

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final spiciesEditController = TextEditingController();
  final personalEditController = TextEditingController();
  final dopingEditController = TextEditingController();
  final skilldeEditController = TextEditingController();
  final EditController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    spiciesEditController.dispose();
    personalEditController.dispose();
    dopingEditController.dispose();
    skilldeEditController.dispose();
    EditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double spdata = 0;
    double pedata = 0;
    double dodata = 0;
    double skdata = 0;
    double realdemage = 0;
    void _changedemage() {
      setState(() {
        realdemage =
            ((spdata + pedata / 2 + dodata / 8 + 5) * 1.1) * skdata * 1.5;
      });
    }

    if (db.collection("users").doc(_auth.currentUser?.uid.toString()) != null) {
      final docRef =
          db.collection("users").doc(_auth.currentUser?.uid.toString());
      docRef.get().then(
        (DocumentSnapshot doc) {
          final data = doc.data() as Map<String, dynamic>;
          // print(data);
          region = data["region"];
          mypo = data["mypokemon"];
          imageUrl = data["imageUrl"];
        },
        onError: (e) => print("Error getting document: $e"),
      );
    } else {
      Toast.show("데이터가 없습니다.", duration: Toast.lengthShort, gravity: Toast.top);
    }

    // Stream collectionStream =
    //     FirebaseFirestore.instance.collection('users').snapshots();
    // Stream documentStream = FirebaseFirestore.instance
    //     .collection('users')
    //     .doc(auth.currentUser.toString())
    //     .snapshots();
    return Scaffold(
      appBar: AppBar(
        title: Text('自分のペイジー'),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: FutureBuilder(
                    future: _fetch3(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                      if (snapshot.hasData == false) {
                        return CircularProgressIndicator();
                      }
                      //error가 발생하게 될 경우 반환하게 되는 부분
                      else if (snapshot.hasError) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Error: ${snapshot.error}',
                            style: TextStyle(fontSize: 15),
                          ),
                        );
                      }
                      // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                      else {
                        if (imageUrl != "") {
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              image: DecorationImage(
                                image: NetworkImage(imageUrl),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://static.wikia.nocookie.net/pokemon/images/e/e5/%EB%82%9C%EC%B2%9C_%EA%B3%B5%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.png/revision/latest/scale-to-width-down/170?cb=20110225143806&path-prefix=ko"),
                              ),
                            ),
                          );
                        }
                      }
                    }),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 220,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://png.pngtree.com/thumb_back/fh260/back_our/20200812/ourmid/pngtree-pink-minimalist-mid-autumn-festival-banner-background-poster-png-image_391702.jpg"),
                    ),
                  ),
                  child: Center(
                    child: FutureBuilder(
                        future: _fetch1(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                          if (snapshot.hasData == false) {
                            return CircularProgressIndicator();
                          }
                          //error가 발생하게 될 경우 반환하게 되는 부분
                          else if (snapshot.hasError) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Error: ${snapshot.error}',
                                style: TextStyle(fontSize: 15),
                              ),
                            );
                          }
                          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                          else {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                snapshot.data.toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                            );
                          }
                        }),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 400,
                  height: 215,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://img1.daumcdn.net/thumb/R1280x0.fjpg/?fname=http://t1.daumcdn.net/brunch/service/user/8LOK/image/Kx3PTA8nv2pHelBbVxvavOi0lK0.JPG"),
                    ),
                  ),
                  child: FutureBuilder(
                      future: _fetch2(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        //해당 부분은 data를 아직 받아 오지 못했을때 실행되는 부분을 의미한다.
                        if (snapshot.hasData == false) {
                          return CircularProgressIndicator();
                        }
                        //error가 발생하게 될 경우 반환하게 되는 부분
                        else if (snapshot.hasError) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        }
                        // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
                        else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  snapshot.data.toString(),
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black54,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Mysmaple()),
                                    );
                                  },
                                  child: Text("내 샘플 올리기、自分のsampleを上げる"),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black54,
                                    elevation: 0,
                                  ),
                                  onPressed: () {},
                                  child: Text("내 샘플 보기、自分のsampleを見る"),
                                ),
                              ],
                            ),
                          );
                        }
                      }),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 400,
                  height: 350,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoTextField(
                          controller: spiciesEditController,
                          placeholder: "종족값",
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoTextField(
                          controller: personalEditController,
                          placeholder: "개체값 1~31",
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoTextField(
                          controller: dopingEditController,
                          placeholder: "노력치 1 ~ 252",
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CupertinoTextField(
                          controller: skilldeEditController,
                          placeholder: "기술 위력",
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            border: Border.all(
                              color: Colors.grey,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          spdata = double.parse(spiciesEditController.text);
                          pedata = double.parse(personalEditController.text);
                          dodata = double.parse(dopingEditController.text);
                          skdata = double.parse(skilldeEditController.text);
                          // print(spdata.toString());
                          // print(pedata.toString());
                          // print(dodata.toString());
                          // print(skdata.toString());

                          _changedemage();
                          Toast.show("기본 결정력" + realdemage.floor().toString(),
                              duration: Toast.lengthShort, gravity: Toast.top);
                          // print(realdemage.floor());
                        },
                        icon: Icon(Icons.search),
                      ),

                      // Text(realdemage),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black26,
                          elevation: 0,
                        ),
                        onPressed: _launchUrl,
                        child: Text('포켓몬 계산기 웹 링크'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<String> _fetch1() async {
  await Future.delayed(Duration(seconds: 2));
  return region;
}

Future<String> _fetch3() async {
  await Future.delayed(Duration(seconds: 2));
  return imageUrl;
}

Future<String> _fetch2() async {
  await Future.delayed(Duration(seconds: 2));
  return mypo;
}

//계산기 링크
Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');
  }
}
