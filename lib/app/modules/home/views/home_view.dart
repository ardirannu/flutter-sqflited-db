import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_db_sqflite/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import '../../../data/models/note_model.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Notes'),
        centerTitle: true,
      ),
      body: FutureBuilder( //bungkus list view builder dengan future builder
        future: controller.getAllNotes(), //supaya function getAllNotes type Future bisa dicall
        builder: (context, snap) {
          return Obx(() => (controller.allNote.length == 0) ? 
            Center(
              child: Text("Data kosong"),
            ) :
            ListView.builder(
              itemCount: controller.allNote.length,
              itemBuilder: (context, index) {
                Note note = controller.allNote[index];
                return ListTile(
                  onTap: () => Get.toNamed(
                    Routes.EDIT_NOTE,
                    arguments: note,
                  ),
                  leading: CircleAvatar(
                    child: Text("${note.id}"),
                  ),
                  title: Text("${note.title}"),
                  subtitle: Text("${note.desc}"),
                  trailing: IconButton(
                    onPressed: () => controller.deleteNote(note.id!), 
                    icon: Icon(Icons.delete)
                  ),
                );    
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_NOTE),
        child: Icon(Icons.add),
      ),
    );
  }
}
