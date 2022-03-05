// ignore_for_file: empty_catches

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_app_flutter/getx/controllers/student_controller.dart';
import 'package:hive_app_flutter/getx/models/student.dart';

class HomeScreen extends StatelessWidget {
  var name = TextEditingController();
  var grade = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentControllers>(
      init:StudentControllers(),
      builder:(controller)=> Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: name,
                        decoration:const InputDecoration(
                          labelText: 'Student Name',
                          prefixIcon: Icon(Icons.person),
                        ),
                      ),
                    ),
                   const SizedBox(width: 20,),
                    Expanded(
                      child: TextFormField(
                        decoration:const InputDecoration(
                          labelText: 'Student Grade',
                          prefixIcon: Icon(Icons.grade),
                        ),
                        controller: grade,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  child: MaterialButton(
                    onPressed: () {
                      try {
                        Student stud = Student(
                            name: name.text, grade: int.parse(grade.text));
                        controller.addStudent(stud);
                        name.text = '';
                        grade.text = '';
                      }
                      catch(ex){
                        print(ex.toString());
                      }
                    },
                    color: Colors.pink,
                    child: const Text(
                      'Add Student',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context,index)=>buildItem(index,controller.students.get(index)),
                      separatorBuilder:  (context,index)=>const SizedBox(height: 15,),
                      itemCount:controller.students.length),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

 Widget buildItem(index,Student student) {
    return GetBuilder<StudentControllers>(
      init: StudentControllers(),
      builder:(controller)=> Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:
            [
               Text(
                student.name,
                style:const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
             const SizedBox(height: 10,),
               Text(
                student.grade.toString(),
                style:const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: (){
            student.name='Fady Zaher';
            student.grade=80;
             controller.editStudent(index, student);
          }, icon:const Icon(Icons.refresh,color: Colors.pink,)),
          const SizedBox(width: 5,),
          IconButton(onPressed: (){
             controller.deleteStudent(index);
          }, icon:const Icon(Icons.delete,color: Colors.pink,)),
        ],
      ),
    );
  }
}
