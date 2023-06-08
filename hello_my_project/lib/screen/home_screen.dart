import 'package:flutter/material.dart';

import 'package:hello_my_project/component/round_box.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }

}


class _HomeScreenState extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height/7,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                '하루하루',
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
          Container(
            height: MediaQuery.of(context).size.height/1.8,
            child: ListView(
              children: [
                RoundBox2(str: "안녕하세요", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
                RoundBox2(str: "너의 일정이다", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
                RoundBox2(str: "이게 너의 일정이다.", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
                RoundBox2(str: "hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world ", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),

              ],
            ),
          ),
          Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }

}