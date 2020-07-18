import 'package:catatan_harian/daftar/daftar_catatan.dart';
import 'package:flutter/material.dart';

class DaftarKonten extends StatelessWidget {
  DaftarKonten({
    @required this.tanggalList,
    @required this.judulList,
    @required this.catatanList,
    @required this.hapusCatatan,
    @required this.ubahCatatan,
    @required this.tambahCatatan,
  });
  final List<String> tanggalList;
  final List<String> judulList;
  final List<String> catatanList;
  final Function(int) hapusCatatan;
  final Function(int) ubahCatatan;
  final Function tambahCatatan;

  Future dialogHapus(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Yakin "${judulList[index]}" akan dihapus?',
          style: TextStyle(fontSize: 12),
        ),
        content: InkWell(
          onTap: () => hapusCatatan(index),
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
            itemCount: tanggalList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onLongPress: () => dialogHapus(context, index),
                  onTap: () => ubahCatatan(index),
                  child: Column(
                    children: <Widget>[
                      DaftarCatatan(
                        index: index,
                        tanggalList: tanggalList,
                        judulList: judulList,
                        catatanList: catatanList,
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
