// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class PoketList extends StatelessWidget {
  const PoketList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도감 리스트 페이지'),
      ),
      body: ListView.builder(
        //포켓몬 갯수 api 사용
        itemCount: 100,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('일러'),
              leading: Text('도감번호'),
              trailing: Text('타입아이콘'),
            ),
          );
        },

        // ignore: prefer_const_literals_to_create_immutables
      ),
    );
  }
}
