// ignore_for_file: use_key_in_widget_ructors, prefer__ructors, prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:pokesearch/custom/custom.dart';
import 'package:pokesearch/custom/settingpage.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Text("언어설정"),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MainSetting(),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg"),
          ),
        ),
        child: Stack(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       fit: BoxFit.cover,
            //       image: NetworkImage(
            //           // 'https://mblogthumb-phinf.pstatic.net/MjAxOTEwMTdfNTgg/MDAxNTcxMjkwOTcxMDU1.ibryD5-KYl0IKqig9z8hc4sVBv7goLQjR66uwl5ZrFYg.C8aBQUgGIHzEOpflm3oD1t9QJ92Sqyi9ZnOEpSbzl1Mg.JPEG.new_springg/KakaoTalk_20191017_132508309.jpg?type=w800'),
            //           // 'https://marketplace.canva.com/EAEsTl8c0D0/1/0/900w/canva-%EC%B2%AD%EB%A1%9D%EC%83%89-%EB%85%B8%ED%8A%B8%EB%B6%81-%EB%AF%B8%EB%8B%88%EB%A9%80%EB%A6%AC%EC%8A%A4%ED%8A%B8-%EB%82%99%EC%84%9C-%EC%83%9D%EC%82%B0%EC%84%B1-%EC%9D%B8%EC%9A%A9%EB%AC%B8-%EB%AC%B8%EA%B5%AC-%ED%9C%B4%EB%8C%80%ED%8F%B0-%EB%B0%B0%EA%B2%BD%ED%99%94%EB%A9%B4-bQaq0hCkOhE.jpg'),
            //           "https://i.pinimg.com/originals/bb/13/85/bb138529b04cf5dba6b39f256ba95562.jpg"),
            //       colorFilter:
            //           ColorFilter.mode(Colors.black12, BlendMode.darken),
            //     ),
            //   ),
            // ),

            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20, top: 20),
                      child: Text(
                        '전국도감, ポケモンエントリー',
                        style: TextStyle(
                            color: Colors.white54,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          //몬스터볼
                          ball(
                              Colors.red,
                              context,
                              Colors.yellow,
                              255,
                              255,
                              'assets/images/monsterball.png',
                              "自分の「sample」登録する",
                              0),
                          //슈퍼볼
                          ball(
                              Colors.blue,
                              context,
                              Colors.red,
                              285,
                              285,
                              'assets/images/superball.png',
                              "自分の「sample」見る",
                              1),
                          //하이퍼볼
                          ball(
                              Colors.brown,
                              context,
                              Colors.yellow,
                              285,
                              285,
                              'assets/images/hiperball.png',
                              "mypage、自分のペイジー",
                              3),

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
                          Text(
                            'ログインすれば友達と一緒に',
                            style: TextStyle(color: Colors.black),
                          ),
                          textBtn(Colors.black26, context, 'ログイン機能', 1),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Text(
                                    'ログインしなくて見る',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  textBtn(
                                      Colors.black26, context, 'エントリーを見る', 2),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  textBtn(Colors.black, context, "練習", 6)
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
