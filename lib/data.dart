class ListCatatan {
  final int id;
  final String judul;
  final String tanggal;
  final String catatan;

  ListCatatan({this.id, this.judul, this.tanggal, this.catatan});

  factory ListCatatan.fromJson(Map<String, dynamic> json) {
    return ListCatatan(
      id: json['id'],
      tanggal: json['tanggal'],
      judul: json['judul'],
      catatan: json['catatan'],
    );
  }
}