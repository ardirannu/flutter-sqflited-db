import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseManager {
  //private contructor
  //untuk membuat instance database
  DatabaseManager._privateContructor();
  static DatabaseManager instance = DatabaseManager._privateContructor();

  Database? _db; //dibuat private supaya tidak bisa diakses langsung

  //getter untuk get database
  Future<Database> get db async{
    if(_db == null){
      _db = await _initDB(); //jika null maka inisialisasi dbnya
      return _db!;
    }

    return _db!;
  }

  Future _initDB() async{
    //buat table db
    Directory documentDirectory = await getApplicationDocumentsDirectory(); //ambil path document directory device

    String path = join(documentDirectory.path, "note.db");

    // open the database
    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async { 
        //perhatikan setiap query sql jangan ada koma diakhir query (Sensitive case)
        return await database.execute( //buat table
          '''
            CREATE table notes (
              id INTEGER PRIMARY KEY,
              title TEXT NOT NULL,
              desc TEXT NOT NULL
            )
          ''',
        );
      }
    );
  }

  Future closeDB() async {
    _db = await instance.db;
    _db!.close();
  }

}