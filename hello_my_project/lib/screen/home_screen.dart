import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:hello_my_project/database/drift_database.dart';

import 'package:hello_my_project/component/round_box.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }

}


class _HomeScreenState extends State<HomeScreen>{
  DateTime selectedDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

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
                selectedDate.year.toString() + '년 ' + selectedDate.month.toString() + '월 ' + selectedDate.day.toString(),
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
                    return RoundBox2(
                      key: ObjectKey(schedule.id),
                      str: schedule.content,
                      label: schedule.date.hour.toString() + '시' + schedule.date.minute.toString() + '분' + ' ' + index.toString() + ' ' + schedule.id.toString(),
                      obscureText: false,
                      onlyRead: false,
                      textEditingController: null,
                    );
                  },
                );
              },
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