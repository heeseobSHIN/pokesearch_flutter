// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:pokesearch/customButtom.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white24,
        ),
        child: Column(
          children: [
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            textBtn(Colors.red, context, '회원가입', 0)
          ],
        ),
      ),
    );
  }
}
