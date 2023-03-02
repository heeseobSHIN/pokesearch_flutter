// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
      ),
      body: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: 350,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://i.kym-cdn.com/entries/icons/original/000/028/261/Matt_CPU.jpg'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 300,
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                    child: Text('유저정보(출신 및 선호 지방, 파트너, 이름)'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                    child: Text('즐겨찾기 목록'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: Center(
                    child: Text('데미지 계산기'),
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