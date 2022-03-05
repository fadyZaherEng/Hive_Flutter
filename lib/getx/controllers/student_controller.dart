// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_app_flutter/getx/models/student.dart';

class StudentControllers extends GetxController{
  var students=Hive.box('Students');
  @override
  void onInit()async {
    super.onInit();
  }
  @override
  void dispose() async{
    super.dispose();
    await Hive.box('Students').close();
  }
  void addStudent(Student student)
  {
    students.add(student);
    getStudents();
    update();
  }
  void getStudents()
  {
    students=Hive.box('Students') ;
    update();
  }
  void editStudent(index,Student student)
  {
    students.putAt(index, student);
    getStudents();
    update();
  }
  void deleteStudent(index)
  {
    students.deleteAt(index);
    getStudents();
    update();
  }
}