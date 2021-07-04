import 'package:catatan_harian/daftar/daftar_catatan.dart';
import 'package:catatan_harian/data.dart';
import 'package:flutter/material.dart';

class DaftarKonten extends StatelessWidget {
  DaftarKonten({
    @required this.snapshot,
    @required this.hapusCatatan,
    @required this.ubahCatatan,
    @required this.tambahCatatan,
  });
  final AsyncSnapshot<List<ListCatatan>> snapshot;
  final Function(int) hapusCatatan;
  final Function(int, String, String, String) ubahCatatan;
  final Function tambahCatatan;

  Future dialogHapus(BuildContext context, String judul, int id) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Yakin "$judul" akan dihapus?',
          style: TextStyle(fontSize: 12),
        ),
        content: InkWell(
          onTap: () => hapusCatatan(id),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFF1761a0),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Hapus',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Harian'),
        backgroundColor: Color(0xFF1761a0),
      ),
      body: SafeArea(
        child: Container(
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onLongPress: () => dialogHapus(
                    context,
                    snapshot.data[index].judul,
                    snapshot.data[index].id,
                  ),
                  onTap: () => ubahCatatan(
                    snapshot.data[index].id,
                    snapshot.data[index].tanggal,
                    snapshot.data[index].judul,
                    snapshot.data[index].catatan,
                  ),
                  child: Column(
                    children: <Widget>[
                      DaftarCatatan(
                        tanggal: snapshot.data[index].tanggal,
                        judul: snapshot.data[index].judul,
                        catatan: snapshot.data[index].catatan,
                      ),
                      Divider(height: 1),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1761a0),
        onPressed: tambahCatatan,
        child: Icon(Icons.add),
      ),
    );
  }
}
