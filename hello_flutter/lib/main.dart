// Copyright 2017, Paul DeMarco.
// All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:flutter_blue_plus/flutter_blue_plus.dart';

import 'package:webview_flutter/webview_flutter.dart';

//import 'widgets.dart';

void main() {
  runApp(hello());
}

class hello extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: helloFlutter(),
      //home: LoadingWindow(),
      home: BottomNavigatorWindow(),
    );
  }
}

class HelloFlutter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement
    return Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.orange,
          ),
          child: SafeArea(
            child: TextButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context){
                      return HelloFlutter1();
                    }
                  )
                );
              },
              child: Text('hello flutter'),
            ),
          ),
        ),
      );
  }
}

class HelloFlutter1 extends StatelessWidget {
  HelloFlutter1({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.orange,
        ),
        child: SafeArea(
          child: TextButton(
            onPressed: () {
              //Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) {
                        return HelloFlutter();
                      }
                  )
              );
            },
            child: Text('hello world'),
          ),
        ),
      ),
    );
  }
}

class LoadingWindow extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
            ),
            Text(
              '하루하루',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Container(
              height: 10,
            ),
            Text(
              '일정관리다이어리',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Container(
              height: 30,
            ),
            Image.asset(
              'assets/hello_world.png',
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigatorWindow extends StatefulWidget {
@override
  State<BottomNavigatorWindow> createState() {
    return _BottomNavigatorWindow();
  }
}

class _BottomNavigatorWindow extends State<BottomNavigatorWindow>{
  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "hello",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "hello",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "hello",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "hello",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.blue,
        backgroundColor: Colors.black,
      ),
    );
  }
}