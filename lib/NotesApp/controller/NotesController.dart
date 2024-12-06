import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getxsratemanagment/NotesApp/modal/modalclass.dart';
import 'package:intl/intl.dart';

TextEditingController title=TextEditingController();
TextEditingController task=TextEditingController();
TextEditingController description=TextEditingController();
DateTime datetime=DateTime.now();
class NotesController extends GetxController{
  RxList<Student> userList=<Student>[].obs;

  void addToList(String task,String title,String description,DateTime dateTime)
  {
    String formatted = DateFormat('hh:mm a').format(dateTime);
    Map emp={
      'task':task,
      'title':title,
      'description':description,
      'dateTime':formatted,
    };

    userList.add(Student.fromMap(emp));
  }

  void removeAtList(int index)
  {
    userList.removeAt(index);
  }
  void updateList(String task,String title,String description,DateTime dateTime,int index)
  {
    String formatted = DateFormat('hh:mm a').format(dateTime);
   title=userList[index].title=title;
   task=userList[index].task=task;
   description=userList[index].description=description;
    formatted=userList[index].dateTime=formatted = DateFormat('hh:mm a').format(dateTime);

    Map emp={
      'task':task,
      'title':title,
      'description':description,
      'dateTime':formatted,
    };
    userList[index]=Student.fromMap(emp);
  }

}