class Note {
  int? id;
  String? title;
  String? desc;

  Note({this.id, this.title, this.desc});

  Note.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['desc'] = desc;
    return data;
  }

  //mengubah daftar objek JSON (yang berupa map atau dictionary) menjadi daftar objek Note
  static List<Note> toJsonList(List? data) {
    if(data == null || data.length == 0) return [];
    return data.map((e) => Note.fromJson(e)).toList();
    // Jika data tidak null atau kosong, maka setiap elemen e dari data (yang diasumsikan merupakan objek JSON) 
    // akan dipetakan ke objek Note dengan memanggil Note.fromJson(e). 
    // Hasil dari pemetaan ini kemudian dikonversi menjadi daftar dengan menggunakan toList().
  }
}
