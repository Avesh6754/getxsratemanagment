import 'package:flutter/material.dart';

class Student {
  late String task, description;
  late String title;
  late String dateTime;

  Student(
      {required this.task,
      required this.title,
      required this.dateTime,
      required this.description});

  factory Student.fromMap(Map m1) {
    return Student(
        task: m1['task'],
        title: m1['title'],
        dateTime: m1['dateTime'],
        description: m1['description']);
  }
}
