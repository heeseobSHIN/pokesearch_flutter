// ignore_for_file: file_names, prefer_const_constructors, duplicate_import, non_constant_identifier_names, unused_import

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pokesearch/list.dart';
import 'package:pokesearch/listdetail.dart';
import 'package:pokesearch/mypage.dart';
import 'package:pokesearch/signup.dart';

import 'home.dart';
import 'list.dart';

ElevatedButton ball(Color fisrt, Color second, double imageWidth,
    double imageHeight, String imagePath) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(300),
      ),
    ),
    onPressed: () {},
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          width: 270,
          height: 270,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(150),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              // ignore: prefer_const_literals_to_create_immutables
              colors: [
                fisrt,
                second,
              ],
            ),
          ),
        ),
        Container(
          width: 255,
          height: 255,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(150),
          ),
        ),
        Container(
          width: imageWidth,
          height: imageHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(150),
            image: DecorationImage(
              image: AssetImage(
                imagePath,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

List<Widget> pages = [
  Home(),
  Signup(),
  PoketList(),
  MyPage(),
  Listdetail(),
];

ElevatedButton textBtn(Color fisrtColor, BuildContext voidcontext,
    String buttontext, int pageList) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: fisrtColor,
      elevation: 0,
    ),
    onPressed: () {
      //여기에 함수
      Navigator.push(
        voidcontext,
        MaterialPageRoute(builder: (context) => pages[pageList]),
      );
    },
    child: Text(buttontext),
  );
}

Container textEntries(String version, String text) {
  return Container(
    width: 330,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.black),
      ),
    ),
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Text(version),
          SizedBox(
            height: 10,
          ),
          Text(text),
        ],
      ),
    ),
  );
}

Padding getKoEntries(
    String Lenlocation, BuildContext ContextC, String version, String text) {
  String Fver = "";
  String Ftex = "";

  if (Lenlocation == "ko") {
    Fver = version;
    Ftex = text;
  } else {
    Fver = "";
    Ftex = "";
  }

  return Padding(
    padding: const EdgeInsets.all(0),
    child: (() {
      if (Fver != "" && Ftex != "") {
        return Container(
          width: MediaQuery.of(ContextC).size.width,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.black),
          )),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(Fver),
              SizedBox(
                height: 10,
              ),
              Text(Ftex),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      } else {
        return Column();
      }
    })(),
  );
}

Padding getKoEntriesjp(
    String Lenlocation, BuildContext ContextC, String version, String text) {
  String Fver = "";
  String Ftex = "";

  if (Lenlocation == "ja") {
    Fver = version;
    Ftex = text;
  } else {
    Fver = "";
    Ftex = "";
  }

  return Padding(
    padding: const EdgeInsets.all(0),
    child: (() {
      if (Fver != "" && Ftex != "") {
        return Container(
          width: MediaQuery.of(ContextC).size.width,
          decoration: BoxDecoration(
              border: Border(
            bottom: BorderSide(color: Colors.black),
          )),
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Text(Fver),
              SizedBox(
                height: 10,
              ),
              Text(Ftex),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        );
      } else {
        return Column();
      }
    })(),
  );
}
