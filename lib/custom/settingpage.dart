// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, deprecated_member_use, unused_local_variable, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, unnecessary_null_comparison, no_leading_underscores_for_local_identifiers, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokesearch/auth/showsample.dart';
import 'package:pokesearch/custom/custom.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:url_launcher/link.dart';
import 'package:flutter/services.dart';
import '../custom/getsampleDoc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var enumValue;

enum Char {
  korean,
  japan,
}

class MainSetting extends StatefulWidget {
  const MainSetting({super.key});

  @override
  State<MainSetting> createState() => _MainSettingState();
}

class _MainSettingState extends State<MainSetting> {
  Char _char = Char.korean;
  @override
  Widget build(BuildContext context) {
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
            image: NetworkImage(
                "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg"),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            RadioListTile(
              title: Text(
                "한글",
                style: TextStyle(fontSize: 35),
              ),
              value: Char.korean,
              groupValue: _char,
              onChanged: (Char? value) {
                setState(() {
                  if (value != null) {
                    _char = value;
                    enumValue = value.name;
                  }
                });
              },
            ),
            SizedBox(
              height: 50,
            ),
            RadioListTile(
              title: Text(
                "日本語",
                style: TextStyle(fontSize: 35),
              ),
              value: Char.japan,
              groupValue: _char,
              onChanged: (Char? value) {
                setState(() {
                  if (value != null) {
                    _char = value;
                    enumValue = value.name;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
