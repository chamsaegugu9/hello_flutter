import 'package:flutter/material.dart';
import 'package:hello_my_project/screen/main_screen.dart';

import 'package:hello_my_project/database/drift_database.dart';
import 'package:get_it/get_it.dart';

void main() {


  final database = LocalDatabase();

  GetIt.I.registerSingleton<LocalDatabase>(database);

  runApp(
    MaterialApp(
      home: MainScreen(),
    )
  );
}
