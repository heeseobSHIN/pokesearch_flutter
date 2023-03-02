// ignore_for_file: file_names, prefer_const_constructors, duplicate_import

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
