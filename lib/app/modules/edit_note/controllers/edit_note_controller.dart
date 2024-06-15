import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/db/db_manager.dart';
import 'package:sqflite/sqflite.dart';

class EditNoteController extends GetxController {
  RxBool isLoading = false.obs;
  DatabaseManager database = DatabaseManager.instance; //instance db manager

  TextEditingController titleC = TextEditingController();
  TextEditingController descC = TextEditingController();

  void editNote(int id) async{
    if(titleC.text.isNotEmpty && descC.text.isNotEmpty){
      isLoading.value = true;

      Database db = await database.db; //call db
      //update data ke db
      await db.update(
        'notes', 
        {
          "id": id,
          "title": titleC.text,
          "desc": descC.text
        },
        where: "id = ?",
        whereArgs: [id],
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      isLoading.value = false;
    }  
  }
}
