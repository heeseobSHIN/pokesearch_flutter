// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, deprecated_member_use, unused_local_variable, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, constant_identifier_names, unnecessary_import, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokesearch/auth/showsample.dart';
import 'package:pokesearch/auth/updatemysample.dart';
import 'package:pokesearch/custom/custom.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:url_launcher/link.dart';
import 'package:flutter/services.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var samname;

class Getsamdoc extends StatefulWidget {
  const Getsamdoc({super.key});

  @override
  State<Getsamdoc> createState() => _GetsamdocState();
}

class _GetsamdocState extends State<Getsamdoc> {
  final nameController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        child: Center(
            child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            CupertinoTextField(
              controller: nameController,
              placeholder: "확인할 샘플 이름을 입력하세요.",
              decoration: BoxDecoration(
                color: Colors.black12,
                border: Border.all(
                  color: Colors.grey,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black54,
                elevation: 0,
              ),
              onPressed: () {
                if (nameController.text != null) {
                  samname = nameController.text;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Showsm()));
                } else {
                  Toast.show("값을 입력해주세요");
                }
              },
              child: Text("샘플보기"),
            ),
          ],
        )),
      ),
    );
  }
}
