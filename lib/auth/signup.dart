// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace, avoid_unnecessary_containers, duplicate_import, unused_field, prefer_final_fields, sort_child_properties_last, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, avoid_types_as_parameter_names, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokesearch/custom/custom.dart';
//dart firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';

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
    var nameTextField = CupertinoTextField(
      controller: nameTextEditController,
      placeholder: "name",
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      onChanged: (Text) {
        // print(Text);
      },
    );

    var ageTextField = CupertinoTextField(
      controller: ageTextEditController,
      placeholder: "나이",
      // obscureText: true,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      onChanged: (Text) {
        // print(Text);
      },
    );
    var regionTextField = CupertinoTextField(
      controller: regionTextEditController,
      placeholder: "출신 지역",
      // obscureText: true,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      onChanged: (Text) {
        // print(Text);
      },
    );
    var imageTextField = CupertinoTextField(
      controller: imageTextEditController,
      placeholder: "대표이미지 Url",
      // obscureText: true,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      onChanged: (Text) {
        // print(Text);
      },
    );
    var mypoTextField = CupertinoTextField(
      controller: mypoTextEditController,
      placeholder: "즐겨찾는 포켓몬",
      // obscureText: true,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey,
        border: Border.all(
          color: Colors.grey,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      onChanged: (Text) {
        // print(Text);
      },
    );

    var PutdataButton = CupertinoButton(
      child: Text("개인 정보 변경"),
      color: Colors.black,
      borderRadius: BorderRadius.circular(12),
      onPressed: () {
        final userCollectionReference = FirebaseFirestore.instance
            .collection("users")
            .doc(auth.currentUser.toString());
        userCollectionReference.set({
          "userName": nameTextEditController.text,
          "age": ageTextEditController.text,
          "region": regionTextEditController.text,
          "imageUrl": imageTextEditController.text,
          "mypokemon": mypoTextEditController.text,
        });
        Toast.show("데이터 적용",
            duration: Toast.lengthShort, gravity: Toast.bottom);
      },
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: SizedBox.expand(
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
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              textBtn(Colors.white12, context, '도감 보기', 2),
                              SizedBox(
                                height: 10,
                              ),
                              textBtn(Colors.white12, context, '마이페이지', 3),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      textBtn(Colors.black, context, "개인정보변경하기", 5),
                      SizedBox(
                        height: 300,
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.black26,
                          elevation: 0,
                        ),
                        onPressed: () {
                          FirebaseAuth.instance.signOut();
                        },
                        child: Text('로그아웃'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
