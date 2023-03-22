// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unused_import, sized_box_for_whitespace, avoid_unnecessary_containers, duplicate_import, unused_field, prefer_final_fields, sort_child_properties_last, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, avoid_print, avoid_types_as_parameter_names, unused_local_variable, camel_case_types, unused_element

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

final db = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;

class update extends StatefulWidget {
  @override
  State<update> createState() => _updateState();
}

class _updateState extends State<update> {
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
            .doc(FirebaseAuth.instance.currentUser?.uid.toString());
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
                  child: Container(
                    child: SizedBox(
                      width: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(height: 10),
                          nameTextField,
                          SizedBox(height: 10),
                          ageTextField,
                          SizedBox(height: 10),
                          regionTextField,
                          SizedBox(height: 10),
                          imageTextField,
                          SizedBox(height: 10),
                          mypoTextField,
                          SizedBox(height: 20),
                          PutdataButton,
                        ],
                      ),
                    ),
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
