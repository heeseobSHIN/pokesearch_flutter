// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace, avoid_unnecessary_containers, duplicate_import, unused_field, prefer_final_fields, sort_child_properties_last, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, avoid_types_as_parameter_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokesearch/auth/mypage.dart';
import 'package:pokesearch/auth/updateinfo.dart';
import 'package:pokesearch/custom/custom.dart';
//dart firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';

import '../decx/list.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final nameTextEditController = TextEditingController();
  final ageTextEditController = TextEditingController();
  final regionTextEditController = TextEditingController();
  final imageTextEditController = TextEditingController();
  final mypoTextEditController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameTextEditController.dispose();
    ageTextEditController.dispose();
    regionTextEditController.dispose();
    imageTextEditController.dispose();
    mypoTextEditController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool selected = false;
    ToastContext().init(context);
    // var nameTextField = CupertinoTextField(
    //   controller: nameTextEditController,
    //   placeholder: "name",
    //   padding: EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     color: Colors.grey,
    //     border: Border.all(
    //       color: Colors.grey,
    //       width: 0.5,
    //     ),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   onChanged: (Text) {
    //     // print(Text);
    //   },
    // );

    // var ageTextField = CupertinoTextField(
    //   controller: ageTextEditController,
    //   placeholder: "나이",
    //   // obscureText: true,
    //   padding: EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     color: Colors.grey,
    //     border: Border.all(
    //       color: Colors.grey,
    //       width: 0.5,
    //     ),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   onChanged: (Text) {
    //     // print(Text);
    //   },
    // );
    // var regionTextField = CupertinoTextField(
    //   controller: regionTextEditController,
    //   placeholder: "출신 지역",
    //   // obscureText: true,
    //   padding: EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     color: Colors.grey,
    //     border: Border.all(
    //       color: Colors.grey,
    //       width: 0.5,
    //     ),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   onChanged: (Text) {
    //     // print(Text);
    //   },
    // );
    // var imageTextField = CupertinoTextField(
    //   controller: imageTextEditController,
    //   placeholder: "대표이미지 Url",
    //   // obscureText: true,
    //   padding: EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     color: Colors.grey,
    //     border: Border.all(
    //       color: Colors.grey,
    //       width: 0.5,
    //     ),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   onChanged: (Text) {
    //     // print(Text);
    //   },
    // );
    // var mypoTextField = CupertinoTextField(
    //   controller: mypoTextEditController,
    //   placeholder: "즐겨찾는 포켓몬",
    //   // obscureText: true,
    //   padding: EdgeInsets.all(10),
    //   decoration: BoxDecoration(
    //     color: Colors.grey,
    //     border: Border.all(
    //       color: Colors.grey,
    //       width: 0.5,
    //     ),
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   onChanged: (Text) {
    //     // print(Text);
    //   },
    // );

    // var PutdataButton = CupertinoButton(
    //   child: Text("개인 정보 변경"),
    //   color: Colors.black,
    //   borderRadius: BorderRadius.circular(12),
    //   onPressed: () {
    //     final userCollectionReference = FirebaseFirestore.instance
    //         .collection("users")
    //         .doc(FirebaseAuth.instance.currentUser?.uid.toString());
    //     userCollectionReference.set({
    //       "userName": nameTextEditController.text,
    //       "age": ageTextEditController.text,
    //       "region": regionTextEditController.text,
    //       "imageUrl": imageTextEditController.text,
    //       "mypokemon": mypoTextEditController.text,
    //     });
    //     Toast.show("데이터 적용",
    //         duration: Toast.lengthShort, gravity: Toast.bottom);
    //   },
    // );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken),
            image: NetworkImage(
              "https://i.pinimg.com/originals/31/51/2a/31512a374041bcc7ba0983f37b67016e.jpg",
            ),
          ),
        ),
        child: SizedBox.expand(
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return SignInScreen(
                    providerConfigs: [EmailProviderConfiguration()]);
              }
              return ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(300),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => PoketList()));
                                },
                                child: Stack(
                                  alignment: AlignmentDirectional.center,
                                  children: [
                                    Text("도감 보기"),
                                    Container(
                                      width: 130,
                                      height: 100,
                                      child: Image(
                                        image: NetworkImage(
                                            "https://www.iconpacks.net/icons/2/free-opened-book-icon-3163-thumb.png"),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(300),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyPage()));
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Text("마이페이지"),
                              Container(
                                width: 110,
                                height: 80,
                                child: Image(
                                  image: NetworkImage(
                                      "http://cdn.onlinewebfonts.com/svg/img_160559.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(300),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => update()));
                          },
                          child: Stack(
                            alignment: AlignmentDirectional.center,
                            children: [
                              Text("개인정보변경하기"),
                              Container(
                                width: 110,
                                height: 80,
                                child: Image(
                                  image: NetworkImage(
                                      "https://cdn.icon-icons.com/icons2/1946/PNG/512/1904675-configuration-edit-gear-options-preferences-setting-settings_122525.png"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        // TextButton(
                        //   style: TextButton.styleFrom(
                        //     backgroundColor: Colors.black45,
                        //     elevation: 0,
                        //   ),
                        //   onPressed: () {
                        //     FirebaseAuth.instance.signOut();
                        //   },
                        //   child: Text('로그아웃'),
                        //   //https://cdn-icons-png.flaticon.com/512/2767/2767155.png
                        // ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(300),
                            ),
                          ),
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 80,
                                child: Image(
                                  image: NetworkImage(
                                      "https://cdn-icons-png.flaticon.com/512/2767/2767155.png"),
                                ),
                              ),
                              Text(
                                "로그아웃",
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    color: Colors.white54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
