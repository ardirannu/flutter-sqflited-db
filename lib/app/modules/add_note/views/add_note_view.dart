import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';
import '../../home/controllers/home_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  final HomeController HomeC = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AddNoteView'),
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
                      controller.addNote();
                      await HomeC.getAllNotes(); //call getAllNotes untuk render ulang data
                      Get.back();
                    }
                  },
                  child: Text(controller.isLoading.isFalse ? "Add Note" : "Loading..."),
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
