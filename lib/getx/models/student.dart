
import 'package:hive_flutter/adapters.dart';
part 'student.g.dart';
@HiveType(typeId: 0)
class Student{
  @HiveField(0)
  String name;
  @HiveField(1)
  int grade;

  Student({
    required this.name,
    required this.grade
 });

}
//command
//flutter packages pub run build_runner build