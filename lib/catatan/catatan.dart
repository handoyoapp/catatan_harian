import 'package:catatan_harian/catatan/isi_catatan.dart';
import 'package:catatan_harian/catatan/judul_catatan.dart';
import 'package:catatan_harian/catatan/simpan_catatan.dart';
import 'package:catatan_harian/catatan/tanggal_catatan.dart';
import 'package:flutter/material.dart';
import 'package:catatan_harian/fungsi_olah_data.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Catatan extends StatefulWidget {
  Catatan({
    this.idList,
    @required this.tanggalList,
    @required this.judulList,
    @required this.catatanList,
  });
  final int idList;
  final List<String> tanggalList;
  final List<String> judulList;
  final List<String> catatanList;

  @override
  _CatatanState createState() => _CatatanState(
      idList: idList,
      tanggalList: tanggalList,
      judulList: judulList,
      catatanList: catatanList);
}

class _CatatanState extends State<Catatan> {
  _CatatanState({
    this.idList,
    @required this.tanggalList,
    @required this.judulList,
    @required this.catatanList,
  });

  int idList;
  List<String> tanggalList;
  List<String> judulList;
  List<String> catatanList;

  TextEditingController judulController = TextEditingController();
  TextEditingController catatanController = TextEditingController();

  void onPressedSimpan() {
    if (idList != null) {
      judulList[idList] = judulController.text;
      catatanList[idList] = catatanController.text;
    } else {
      if (tanggalList == null) tanggalList = [];
      String tanggalCatatan = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now());
      String jamCatatan = DateFormat('hh:mm:ss', 'id_ID').format(DateTime.now());
      tanggalList.add('$tanggalCatatan jam $jamCatatan');

      if (judulList == null) judulList = [];
      judulList.add(judulController.text);

      if (catatanList == null) catatanList = [];
      catatanList.add(catatanController.text);
    }

    if (judulController.text.isNotEmpty) {
      simpanData('dataTanggal', tanggalList);
      simpanData('dataJudul', judulList);
      simpanData('dataCatatan', catatanList);
    }
    Navigator.pop(context, 'berhasil');
  }

  @override
  Widget build(BuildContext context) {
    const locale = 'id';
    initializeDateFormatting(locale).then((_) {
      DateFormat.Hm(locale);
    });

    if (idList != null) {
      judulController.text = judulList[idList];
      catatanController.text = catatanList[idList];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(idList == null ? 'Tambah Catatan' : 'Ubah Catatan'),
        backgroundColor: Color(0xFF1761a0),
      ),
      body: Builder(
        builder: (context) => SafeArea(
          child: Container(
            child: Stack(
              children: <Widget>[
                ListView(
                  physics: const ClampingScrollPhysics(),
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(height: 10),
                        TanggalCatatan(
                          idList: idList,
                          tanggalList: tanggalList,
                        ),
                        JudulCatatan(judulController: judulController),
                        Divider(height: 1),
                        IsiCatatan(catatanController: catatanController),
                      ],
                    ),
                    SizedBox(height: 45),
                  ],
                ),
                SimpanCatatan(onPressedSimpan: onPressedSimpan),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
