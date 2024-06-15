import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../data/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';

class AddNoteController extends GetxController {
  RxBool isLoading = false.obs;
  DatabaseManager database = DatabaseManager.instance; //instance db manager

  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  void addNote() async{
    if(titleC.text.isNotEmpty && descC.text.isNotEmpty){
      isLoading.value = true;

      Database db = await database.db; //call db
      //insert data ke db
      await db.insert('notes', {
        "id": Random().nextInt(1000),
        "title": titleC.text,
        "desc": descC.text
      },
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      isLoading.value = false;
    }  
  }

}
