// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, unused_import, deprecated_member_use, unused_local_variable, non_constant_identifier_names, avoid_print, prefer_typing_uninitialized_variables, unnecessary_null_comparison, prefer_const_literals_to_create_immutables, constant_identifier_names, unnecessary_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokesearch/auth/showsample.dart';
import 'package:pokesearch/custom/custom.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:url_launcher/link.dart';
import 'package:flutter/services.dart';
import 'signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final db = FirebaseFirestore.instance;
var enumValue;
var ponameforshow;

enum Char {
  Hardy,
  Lonely,
  Adamant,
  Naughty,
  Brave,
  Bold,
  Docile,
  Impish,
  Lax,
  Relaxed,
  Modest,
  Mild,
  Bashful,
  Rash,
  Quiet,
  Calm,
  Gentle,
  Careful,
  Quirky,
  Sassy,
  Timid,
  Hasty,
  Jolly,
  Naive,
  Serious
}

class Mysmaple extends StatefulWidget {
  const Mysmaple({super.key});

  @override
  State<Mysmaple> createState() => _MysmapleState();
}

class _MysmapleState extends State<Mysmaple> {
  final nameController = TextEditingController();
  final hController = TextEditingController();
  final aController = TextEditingController();
  final bController = TextEditingController();
  final cController = TextEditingController();
  final dController = TextEditingController();
  final sController = TextEditingController();
  final opinionController = TextEditingController();
  final mainskillController = TextEditingController();
  final subskillController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    hController.dispose();
    aController.dispose();
    bController.dispose();
    cController.dispose();
    dController.dispose();
    sController.dispose();
    opinionController.dispose();
    mainskillController.dispose();
    subskillController.dispose();
    super.dispose();
  }

  Char _char = Char.Hardy;
  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('샘플 올리기'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text("노력치"),
              SizedBox(
                height: 10,
              ),
              sampleinputcard('   Enter name : (띄어쓰기없이)', nameController),
              sampleinputcard('   Enter H : ', hController),
              sampleinputcard('   Enter A : ', aController),
              sampleinputcard('   Enter B : ', bController),
              sampleinputcard('   Enter C : ', cController),
              sampleinputcard('   Enter D : ', dController),
              sampleinputcard('   Enter S : ', sController),
              sampleinputcard('   노력치 배분 의도 : ', opinionController),
              SizedBox(
                height: 10,
              ),
              Text("성격"),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        child: Column(
                          children: [
                            RadioListTile(
                              subtitle: Text("-"),
                              title: Text(
                                "노력",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Hardy,
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
                            RadioListTile(
                              subtitle: Text(
                                "A+, B-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "외로움",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Lonely,
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
                            RadioListTile(
                              subtitle: Text(
                                "A+, C-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "고집",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Adamant,
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
                            RadioListTile(
                              subtitle: Text(
                                "A+, D-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "개구쟁이",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Naughty,
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
                            RadioListTile(
                              subtitle: Text(
                                "A+, S-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "용감",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Brave,
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
                      Container(
                        width: 150,
                        child: Column(
                          children: [
                            RadioListTile(
                              subtitle: Text(
                                "B+, A-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "대담",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Bold,
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
                            RadioListTile(
                              subtitle: Text("-"),
                              title: Text(
                                "온순",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Docile,
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
                            RadioListTile(
                              subtitle: Text(
                                "B+, C-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "장난꾸러기",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Impish,
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
                            RadioListTile(
                              subtitle: Text(
                                "B+, D-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "촐랑",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Lax,
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
                            RadioListTile(
                              subtitle: Text(
                                "B+, S-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "무사태평",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Relaxed,
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
                      Container(
                        width: 150,
                        child: Column(
                          children: [
                            RadioListTile(
                              subtitle: Text(
                                "C+, A-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "조심",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Modest,
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
                            RadioListTile(
                              subtitle: Text(
                                "C+, B-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "의젓",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Mild,
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
                            RadioListTile(
                              subtitle: Text("-"),
                              title: Text(
                                "수줍음",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Bashful,
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
                            RadioListTile(
                              subtitle: Text(
                                "C+, D-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "덜렁",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Rash,
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
                            RadioListTile(
                              subtitle: Text(
                                "C+, S-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "냉정",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Quiet,
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
                      Container(
                        width: 150,
                        child: Column(
                          children: [
                            RadioListTile(
                              subtitle: Text(
                                "D+, A-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "차분",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Calm,
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
                            RadioListTile(
                              subtitle: Text(
                                "D+, B-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "얌전",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Gentle,
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
                            RadioListTile(
                              subtitle: Text(
                                "D+, C-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "신중",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Careful,
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
                            RadioListTile(
                              subtitle: Text("-"),
                              title: Text(
                                "변덕",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Quirky,
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
                            RadioListTile(
                              subtitle: Text(
                                "D+, S-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "건방",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Sassy,
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
                      Container(
                        width: 150,
                        child: Column(
                          children: [
                            RadioListTile(
                              subtitle: Text(
                                "S+, A-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "겁쟁이",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Timid,
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
                            RadioListTile(
                              subtitle: Text(
                                "S+, B-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "성급",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Hasty,
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
                            RadioListTile(
                              subtitle: Text(
                                "S+, C-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "명랑",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Jolly,
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
                            RadioListTile(
                              subtitle: Text(
                                "S+, D-",
                                style: TextStyle(fontSize: 8),
                              ),
                              title: Text(
                                "천진난만",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Naive,
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
                            RadioListTile(
                              subtitle: Text("-"),
                              title: Text(
                                "성실",
                                style: TextStyle(fontSize: 10),
                              ),
                              value: Char.Serious,
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
                    ],
                  ),
                ),
              ),
              sampleinputcard("주기술 이름 목록", mainskillController),
              sampleinputcard("후보 기술 목록", subskillController),
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 80.0, right: 20, top: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white24,
                        elevation: 0,
                      ),
                      onPressed: () {
                        final userCollectionReference = db
                            .collection("mysample")
                            .doc(nameController.text.toString());
                        userCollectionReference.set({
                          "h": hController.text,
                          "a": aController.text,
                          "b": bController.text,
                          "c": cController.text,
                          "d": dController.text,
                          "s": sController.text,
                          "reason": opinionController.text,
                          "성격": enumValue.toString(),
                          "주기술": mainskillController.text,
                          "후보기술": subskillController.text,
                        });
                        ponameforshow = nameController.text.toString();
                        Toast.show("등록완료",
                            duration: Toast.lengthShort, gravity: Toast.top);
                      },
                      child: Text("등록하기"),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 10.0, right: 20, top: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white38,
                        elevation: 0,
                      ),
                      onPressed: () {
//Showsm
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Showsm()));
                      },
                      child: Text("샘플보러가기"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Card sampleinputcard(
  String label,
  dynamic controll,
) {
  return Card(
    shape: RoundedRectangleBorder(
      //모서리를 둥글게 하기 위해 사용
      borderRadius: BorderRadius.circular(16.0),
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 3),
      child: CupertinoTextField(
        controller: controll,
        placeholder: label,
        decoration: BoxDecoration(
          color: Colors.black12,
          border: Border.all(
            color: Colors.grey,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}
