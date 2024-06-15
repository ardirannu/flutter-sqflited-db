import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_note_controller.dart';
import '../../../data/models/note_model.dart';
import '../../home/controllers/home_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  Note note = Get.arguments; //get data note by argument dari home view (route)
  final HomeController HomeC = Get.find();

  @override
  Widget build(BuildContext context) {
    controller.titleC.text = note.title!; //set data note ke dalam controller
    controller.descC.text = note.desc!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Note'),
        centerTitle: true,
      ),
      body: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextField(
              controller: controller.titleC,
              decoration: InputDecoration(
                  labelText: "Title", border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            TextField(
              controller: controller.descC,
              decoration: InputDecoration(
                  labelText: "Description", border: OutlineInputBorder()),
            ),
            SizedBox(height: 15),
            Obx(() => ElevatedButton(
                  onPressed: () async{
                    if (controller.isLoading.isFalse) {
                      controller.editNote(note.id!);
                      await HomeC.getAllNotes(); //call getAllNotes untuk render ulang data
                      Get.back();
                    }
                  },
                  child: Text(controller.isLoading.isFalse ? "Edit Note" : "Loading..."),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 0, 140, 255),
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ))
          ],
        ));
  }
}
