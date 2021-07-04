import 'dart:convert';
import 'package:catatan_harian/bantuan.dart';
import 'package:catatan_harian/catatan/isi_catatan.dart';
import 'package:catatan_harian/catatan/judul_catatan.dart';
import 'package:catatan_harian/catatan/simpan_catatan.dart';
import 'package:catatan_harian/catatan/tanggal_catatan.dart';
import 'package:catatan_harian/endpoint.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:http/http.dart' as http;

class Catatan extends StatefulWidget {
  Catatan({
    this.id,
    @required this.tanggal,
    @required this.judul,
    @required this.catatan,
  });
  final int id;
  final String tanggal;
  final String judul;
  final String catatan;

  @override
  _CatatanState createState() =>
      _CatatanState(id: id, tanggal: tanggal, judul: judul, catatan: catatan);
}

class _CatatanState extends State<Catatan> {
  _CatatanState({
    this.id,
    @required this.tanggal,
    @required this.judul,
    @required this.catatan,
  });

  int id;
  String tanggal;
  String judul;
  String catatan;

  TextEditingController judulController = TextEditingController();
  TextEditingController catatanController = TextEditingController();

  Future<void> onPressedSimpan() async {
    if (id != null) {
      judul = judulController.text;
      catatan = catatanController.text;

      final response = await http.post(
        Uri.parse('$UBAH_CATATAN'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'id': id.toString(),
          'tanggal': tanggal,
          'judul': judul,
          'catatan': catatan
        }),
      );

      if (response.statusCode == 200) {
        Navigator.pop(context, 'berhasil');
      } else {
        throw Exception('Gagal untuk mengubah catatan');
      }
    } else {
      String judul = judulController.text;
      String catatan = catatanController.text;

      final response = await http.post(
        Uri.parse('$TAMBAH_CATATAN'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'tanggal': formatDateYMDFromDateTime(DateTime.now()),
          'judul': judul,
          'catatan': catatan
        }),
      );

      if (response.statusCode == 200) {
        Navigator.pop(context, 'berhasil');
      } else {
        throw Exception('Gagal untuk menyimpan catatan');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const locale = 'id';
    initializeDateFormatting(locale).then((_) {
      DateFormat.Hm(locale);
    });

    if (id != null) {
      judulController.text = judul;
      catatanController.text = catatan;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(id == null ? 'Tambah Catatan' : 'Ubah Catatan'),
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
                          id: id,
                          tanggal: tanggal,
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
