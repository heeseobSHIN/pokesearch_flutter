// ignore_for_file: use_key_in_widget_ructors, prefer__ructors, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pokesearch/customButtom.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://mblogthumb-phinf.pstatic.net/MjAxOTEwMTdfNTgg/MDAxNTcxMjkwOTcxMDU1.ibryD5-KYl0IKqig9z8hc4sVBv7goLQjR66uwl5ZrFYg.C8aBQUgGIHzEOpflm3oD1t9QJ92Sqyi9ZnOEpSbzl1Mg.JPEG.new_springg/KakaoTalk_20191017_132508309.jpg?type=w800'),
                  colorFilter:
                      ColorFilter.mode(Colors.black12, BlendMode.darken),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: Text(
                        '전국도감',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //몬스터볼
                          ball(Colors.red, Colors.yellow, 255, 255,
                              'assets/images/monsterball.png'),
                          //슈퍼볼
                          ball(Colors.blue, Colors.red, 285, 285,
                              'assets/images/superball.png'),
                          //하이퍼볼
                          ball(Colors.brown, Colors.yellow, 285, 285,
                              'assets/images/hiperball.png'),

                          //슈퍼볼
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      height: 100,
                    ),
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Id',
                              hintStyle: TextStyle(color: Colors.black26),
                            ),
                          ),
                          TextFormField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.black26), //<-- SEE HERE
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 60.0, top: 30),
                            child: Row(
                              children: [
                                textBtn(Colors.grey, context, '로그인', 2),
                                Padding(
                                  padding: EdgeInsets.only(left: 30.0),
                                  child: textBtn(
                                      Colors.black12, context, '회원가입', 1),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '로그인하면 친구기능',
                            style: TextStyle(color: Colors.black),
                          ),
                          Container(
                            decoration: BoxDecoration(border: Border.all()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    '로그인 없이 시작',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  textBtn(Colors.black12, context, '도감 보기', 2),
                                  textBtn(Colors.black12, context, '마이페이지', 3),
                                  textBtn(Colors.black12, context, '도감 디테일', 4),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
