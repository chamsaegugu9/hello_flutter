import 'package:flutter/material.dart';


import 'package:hello_my_project/screen/home_screen.dart';
import 'package:hello_my_project/screen/schedule_screen.dart';

class MainScreen extends StatefulWidget {
  //final MainScreen({Key? key}):super(key: key);

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }


}

class _MainScreenState extends State<MainScreen>{
  int _selectedIndex = 0;
  final PageController pageController = PageController(initialPage: 0);

  @override
  void initState(){

    super.initState();
  }
  @override
  void dispose(){
    pageController.dispose();
    super.dispose();
  }



  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
      pageController.jumpToPage(_selectedIndex);
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
            /*BottomNavigationBarItem(
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
            ),*/
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFFFF6E92),
          unselectedItemColor: Color(0xFF0AAEEC),
          backgroundColor: Color(0xFFC9D6F7),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            //Text('hello world1'),
            //Text('hello world2'),
            HomeScreen(),
            MainCalendar(),
            //Text('hello world5'),
          ]
        )
    );
  }
}

