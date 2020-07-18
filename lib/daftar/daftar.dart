import 'package:catatan_harian/catatan/catatan.dart';
import 'package:catatan_harian/daftar/daftar_kosong.dart';
import 'package:catatan_harian/daftar/daftar_konten.dart';
import 'package:catatan_harian/daftar/loading.dart';
import 'package:catatan_harian/fungsi_olah_data.dart';
import 'package:flutter/material.dart';

class Daftar extends StatefulWidget {
  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  List<String> tanggalList = [];
  List<String> judulList = [];
  List<String> catatanList = [];

  Future<void> initData() async {
    tanggalList = await ambilData('dataTanggal');
    judulList = await ambilData('dataJudul');
    catatanList = await ambilData('dataCatatan');
  }

  void tambahCatatan() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Catatan(
          tanggalList: tanggalList,
          judulList: judulList,
          catatanList: catatanList,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        initData();
      });
    }
  }

  void ubahCatatan(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Catatan(
          idList: index,
          tanggalList: tanggalList,
          judulList: judulList,
          catatanList: catatanList,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        initData();
      });
    }
  }

  void hapusCatatan(int index) {
    setState(() {
      tanggalList.removeAt(index);
      judulList.removeAt(index);
      catatanList.removeAt(index);
      simpanData('dataTanggal', tanggalList);
      simpanData('dataJudul', judulList);
      simpanData('dataCatatan', catatanList);
      Navigator.pop(context);
      initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (tanggalList == null || tanggalList.isEmpty) {
            return DaftarKosong(tambahCatatan: tambahCatatan);
          } else {
            return DaftarKonten(
              tanggalList: tanggalList,
              judulList: judulList,
              catatanList: catatanList,
              ubahCatatan: ubahCatatan,
              hapusCatatan: hapusCatatan,
              tambahCatatan: tambahCatatan,
            );
          }
        }
        return Loading();
      },
    );
  }
}
