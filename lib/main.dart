import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_app_flutter/getx/models/student.dart';
import 'package:hive_app_flutter/getx/views/home.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final Directory dir =await path_provider.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(StudentAdapter());
  await Hive.openBox('Students');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       theme: ThemeData(
         primaryColor: Colors.pink,
         primarySwatch: Colors.pink,
       ),
       home: HomeScreen(),
     );
  }
}

