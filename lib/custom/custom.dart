// ignore_for_file: file_names, prefer_const_constructors, duplicate_import, non_constant_identifier_names, unused_import, sort_child_properties_last, sized_box_for_whitespace

import 'dart:math';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../decx/list.dart';
import '../decx/listdetail.dart';
import 'package:pokesearch/auth/mypage.dart';
import 'package:pokesearch/auth/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../home/home.dart';
import '../decx/list.dart';
import '../auth/updateinfo.dart';
import 'test.dart';

//몬스터볼 버튼
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
  update(),
  ChartsDemo()
];

//페이지 이동 텍스트버튼
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

//?
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

//도감설명 한국어
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

//도감설명 일본어
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

//종족값
// Padding getstats(BuildContext ContextC, String hp, String attack,
//     String defense, String specialAttack, String specialDefense, String speed) {
//   return Padding(
//     padding: const EdgeInsets.all(0),
//     child: (() {
//       return Container(
//         width: MediaQuery.of(ContextC).size.width,
//         decoration: BoxDecoration(
//             border: Border(
//           bottom: BorderSide(color: Colors.black),
//         )),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 5,
//             ),
//             Text(''),
//             SizedBox(
//               height: 10,
//             ),
//             Text(''),
//             SizedBox(
//               height: 5,
//             ),
//           ],
//         ),
//       );
//     })(),
//   );
// }

//파이어스토어 데이터 인풋
CupertinoButton Putdata(
  String user,
  String userName,
  String age,
  String region,
  String imageUrl,
  String mypokemon,
) {
  return CupertinoButton(
    child: Text("데이터 삽입"),
    color: Colors.black,
    borderRadius: BorderRadius.circular(12),
    onPressed: () {
      final userCollectionReference =
          FirebaseFirestore.instance.collection("users").doc(user);
      userCollectionReference.set({
        "userName": userName,
        "age": age,
        "region": region,
        "imageUrl": imageUrl,
        "mypokemon": mypokemon,
      });
    },
  );
}

//데미지 계산식
// class DemageCal {

//   int skilldm;
//   int atstat;
//   int dfstat;
//   final nansu = Random().nextInt(100 - 85);
//   bool mytype = true;
//   int dmpoint;

//   var demage = 22 * skilldm * atstat / 50 / dfstat *nansu / 100 * 1.5 * dmpoint ;

//   DemageCal(
//     // this.nansu,
//     this.skilldm,
//     this.atstat,
//     this.mytype,
//     this.dfstat,
//     this.dmpoint,
//   );
// }

//차트
Container Chart(List<charts.Series<dynamic, String>> firstlist) {
  return Container(
    width: 300,
    height: 300,
    child: charts.BarChart(
      firstlist,
      animate: true,
      vertical: false,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      domainAxis: const charts.OrdinalAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
    ),
  );
}

//결정력 계산
// IconButton getDemage(
//     double spicies, double personal, double doping, double skillde) {
//   double realdemage;
//   return IconButton(
//     onPressed: () {
//       realdemage =
//           ((spicies + personal / 2 + doping / 8 + 5) * 1.1) * skillde * 1.5;
//       print(realdemage.floor());
//     },
//     icon: Icon(Icons.abc),
//   );
// }
