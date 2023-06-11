import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hello_my_project/database/drift_database.dart';

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

  final GlobalKey<FormState> formKey1 = GlobalKey();
  final GlobalKey<FormState> formKey2 = GlobalKey();

  int? startTime;
  int? startTime1;
  int? startTime2;
  String? content;

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
              selectedDate.year.toString() + '년' + ' ' +
              selectedDate.month.toString() + '월' + ' ' +
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
            /*child: ListView(
              children: [
                RoundBox3(str: "안녕하세요", label: "00시 00분", obscureText: false, onlyRead: false, textEditingController: null),
                RoundBox3(str: "너의 일정이다", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
                RoundBox3(str: "이게 너의 일정이다.", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
                RoundBox3(str: "hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world hello world ", label: "00시 00분", obscureText: false, onlyRead: true, textEditingController: null),
              ],
            ),*/
            child: StreamBuilder<List<Schedule>>(
              stream: GetIt.I<LocalDatabase>().watchSchdules(selectedDate),
              builder: (content, snapshot){
                if(!snapshot.hasData){
                  return Container();
                }

                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    final Schedule schedule = snapshot.data![index];
                    return RoundBox3(
                      key: ObjectKey(schedule.id),
                      str: schedule.content,
                      label: schedule.date.hour.toString() + '시' + schedule.date.minute.toString() + '분' + ' ' + index.toString() + ' ' + schedule.id.toString(),
                      obscureText: false,
                      onlyRead: false,
                      textEditingController: null,
                      ontap: () {
                        GetIt.I<LocalDatabase>().removeSchedule(schedule.id);

                      },
                    );
                  },
                );
              },
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
            height: MediaQuery.of(context).size.height/1.85,
            child: Form(
              key: formKey1,
              child: Stack(
                children: [
                  Positioned(
                    child: RoundBox4(
                      str: "00",
                      label: "시",
                      obscureText: false,
                      onlyRead: false,
                      textEditingController: null,
                      onSaved: (String? val){
                        startTime1 = int.parse(val!);
                      },
                      validator: (String? val){
                        if(val==null){
                          return '값을 입력해주세요.';
                        }

                        int? number;

                        try{
                          number = int.parse(val);
                        }
                        catch(e){
                          return '숫자를 입력해주세요.';
                        }

                        if(number < 0 || number >24){
                          return '0시 부터 24시 사이를 입력해주세요.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Positioned(
                    top: 100,
                    child: RoundBox4(
                      str: "00",
                      label: "분",
                      obscureText: false,
                      onlyRead: false,
                      textEditingController: null,
                      onSaved: (String? val){
                        startTime2 = int.parse(val!);
                      },
                      validator: (String? val){
                        if(val==null){
                          return '값을 입력해주세요.';
                        }

                        int? number;

                        try{
                          number = int.parse(val);
                        }
                        catch(e){
                          return '숫자를 입력해주세요.';
                        }

                        if(number < 0 || number >60){
                          return '0시 부터 60분 사이를 입력해주세요.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width*0.9,
                    bottom: 0,
                    //left: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EButton(
                          text: '추가',
                          onPressed: (){
                            if(formKey1.currentState!.validate()){
                              formKey1.currentState!.save();
                              setState(() {
                                popAdd2 = true;
                              });
                            }

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
                  ),
                ],
              ),
            )
          ),

        if(popAdd2)
          Container(
            height: MediaQuery.of(context).size.height/1.85,
            child: Form(
              key: formKey2,
              child: Stack(
                children: [
                  Positioned(
                    child: RoundBox5(
                      label: "",
                      str: "",
                      textEditingController: null,
                      onlyRead: false,
                      obscureText: false,
                      onSaved: (String? val){
                        content = val;
                      },
                      validator: (String? val){
                        if(val == null){
                          return '값을 입력해주세요.';
                        }
                        if(val.length <= 0){
                          return '값을 입력해주세요.';
                        }
                        return null;
                      },
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width*0.9,
                    bottom: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        EButton(
                          text: '추가',
                          onPressed: () async {
                            if(formKey2.currentState!.validate()){
                              formKey2.currentState!.save();
                              startTime = startTime1! * 100 + startTime2!;
                              await GetIt.I<LocalDatabase>().createSchedule(
                                SchedulesCompanion(
                                  startTime: Value(startTime!),
                                  content: Value(content!),
                                  date: Value(selectedDate),
                                )
                              );
                              setState(() {
                                popAdd2 = false;
                                popAdd = false;
                              });
                            }
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
                  )
                ],
              ),
            ),
          ),
        Divider(
          thickness: 1.0,
          color: Colors.black,
        ),
      ],
    );
  }



}