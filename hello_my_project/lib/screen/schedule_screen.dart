import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

import 'package:hello_my_project/component/round_box.dart';

class MainCalendar extends StatefulWidget{

  @override
  State<MainCalendar> createState() {
    return _MainCalendarState();
  }
}

class _MainCalendarState extends State<MainCalendar>{
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
  );
  bool onOff = false;
  bool popAdd = false;
  bool popAdd2 = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          if(!onOff)
            TableCalendar(

              onDaySelected: onDaySelected,
              selectedDayPredicate: (date){
                return date.year == this.selectedDate.year && date.month == this.selectedDate.month && date.day == this.selectedDate.day;
              },

              firstDay: DateTime(1800,1,1,),
              lastDay: DateTime(3000,1,1,),
              focusedDay: DateTime.now(),

              daysOfWeekHeight: 40.0,
              rowHeight: 70.0,

              headerStyle: HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
              ),
              calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFFFBB8C),
                  ),
                  weekendDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFFAB2B2),
                  ),
                  selectedDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF3CC8C8),
                  ),
                  defaultDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFFDADADA),
                  )
              ),
            ),
          if(onOff)
            popSelected(),
        ],
      )
    );
  }

  void onDaySelected(DateTime selectedDate, DateTime focusedDate){
    setState(() {
      onOff = true;
      this.selectedDate = selectedDate;
    });
  }

  Widget popSelected(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: MediaQuery.of(context).size.height/7,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              selectedDate.day.toString() + '일',
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
        if(!popAdd)
          Container(
            height: MediaQuery.of(context).size.height/2.1,
            child: ListView(
              children: [
                RoundBox3(str: "안녕하세요", label: "00시 00분", obscureText: false, onlyRead: false, textEditingController: null),
                RoundBox3(str: "너의 일정이다", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
                RoundBox3(str: "이게 너의 일정이다.", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
                RoundBox3(str: "hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world ", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
              ],
            ),
          ),
        if(!popAdd)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EButton(
                text: '추가',
                onPressed: (){
                  setState(() {
                    popAdd = true;
                  });
                },
              ),
              EButton(
                  text: '취소',
                  onPressed: (){
                    setState(() {
                      onOff = false;
                    });
                  }
              ),

            ],
          ),
        if(popAdd && !popAdd2)
          Container(
            height: MediaQuery.of(context).size.height/2.1,
            child: Stack(
              children: [
                Positioned(
                  child: RoundBox4(str: "00", label: "시", obscureText: false, onlyRead: false, textEditingController: null),
                ),
                Positioned(
                  top: 100,
                  child: RoundBox4(str: "00", label: "분", obscureText: false, onlyRead: false, textEditingController: null),
                ),

              ],
            ),
          ),
        if(popAdd && !popAdd2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EButton(
                text: '추가',
                onPressed: (){
                  setState(() {
                    popAdd2 = true;
                  });
                },
              ),
              EButton(
                  text: '취소',
                  onPressed: (){
                    setState(() {
                      popAdd = false;
                    });
                  }
              ),

            ],
          ),
        if(popAdd2)
          Container(
            height: MediaQuery.of(context).size.height/2.1,
            child: RoundBox5(
              label: "",
              str: "",
              textEditingController: null,
              onlyRead: false,
              obscureText: false,

            ),
          ),
        if(popAdd2)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              EButton(
                text: '추가',
                onPressed: (){
                  setState(() {
                    //popAdd2 = true;
                  });
                },
              ),
              EButton(
                  text: '취소',
                  onPressed: (){
                    setState(() {
                      popAdd2 = false;
                    });
                  }
              ),

            ],
          ),
        Divider(
          thickness: 1.0,
          color: Colors.black,
        ),
      ],
    );
  }

  List<Widget> showSchedule(){
    return [
      Container(
        height: MediaQuery.of(context).size.height/7,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            selectedDate.day.toString() + '일',
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
        height: MediaQuery.of(context).size.height/2.1,
        child: ListView(
          children: [
            RoundBox3(str: "안녕하세요", label: "00시 00분", obscureText: false, onlyRead: false, textEditingController: null),
            RoundBox3(str: "너의 일정이다", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
            RoundBox3(str: "이게 너의 일정이다.", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
            RoundBox3(str: "hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world ", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EButton(
            text: '추가',
            onPressed: (){
              setState(() {
                popAdd = true;
              });
            },
          ),
          EButton(
              text: '취소',
              onPressed: (){
                setState(() {
                  onOff = false;
                });
              }
          ),

        ],
      ),
      Divider(
        thickness: 1.0,
        color: Colors.black,
      ),
    ];
  }

  List<Widget> selectDate(){
    return [
      Container(
        height: MediaQuery.of(context).size.height/7,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            selectedDate.day.toString() + '일',
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
        height: MediaQuery.of(context).size.height/2.1,
        child: ListView(
          children: [
            RoundBox3(str: "안녕하세요", label: "00시 00분", obscureText: false, onlyRead: false, textEditingController: null),
            RoundBox3(str: "너의 일정이다", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
            RoundBox3(str: "이게 너의 일정이다.", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
            RoundBox3(str: "hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world ", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          EButton(
            text: '추가',
            onPressed: (){},
          ),
          EButton(
              text: '취소',
              onPressed: (){
                setState(() {
                  popAdd = false;
                });
              }
          ),

        ],
      ),
      Divider(
        thickness: 1.0,
        color: Colors.black,
      ),
    ];
  }
}