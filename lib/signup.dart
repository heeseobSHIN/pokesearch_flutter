// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:pokesearch/customButtom.dart';
//dart firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
          },
          child: Text('로그아웃'),
        ),
      ),
      body: SizedBox.expand(
        child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return SignInScreen(
                  providerConfigs: [EmailProviderConfiguration()]);
            }
            return ListView(
              children: [
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Container(
                    width: 300,
                    child: Column(
                      children: [
                        Text(
                          '로그인하면 친구기능',
                          style: TextStyle(color: Colors.white),
                        ),
                        Container(
                          decoration: BoxDecoration(border: Border.all()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                textBtn(Colors.white12, context, '도감 보기', 2),
                                SizedBox(
                                  height: 10,
                                ),
                                textBtn(Colors.white12, context, '마이페이지', 3),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
