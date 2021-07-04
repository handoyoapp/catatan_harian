import 'dart:convert';
import 'package:catatan_harian/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:catatan_harian/catatan/catatan.dart';
import 'package:catatan_harian/daftar/loading.dart';
import 'package:flutter/material.dart';
import 'daftar_konten.dart';
import 'daftar_kosong.dart';
import '../data.dart';

class Daftar extends StatefulWidget {
  @override
  _DaftarState createState() => _DaftarState();
}

class _DaftarState extends State<Daftar> {
  void tambahCatatan() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Catatan(
          tanggal: '',
          judul: '',
          catatan: '',
        ),
      ),
    );
    if (result != null) {
      setState(() {
        futureCatatan = fetchDaftarCatatan();
      });
    }
  }

  void ubahCatatan(int id, String tanggal, String judul, String catatan) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Catatan(
          id: id,
          tanggal: tanggal,
          judul: judul,
          catatan: catatan,
        ),
      ),
    );
    if (result != null) {
      setState(() {
        futureCatatan = fetchDaftarCatatan();
      });
    }
  }

  Future<void> hapusCatatan(int id) async {
    final response = await http.get('$HAPUS_CATATAN?id=$id');
    if (response.statusCode == 200) {
    } else {
      throw Exception('Gagal Menghapus Catatan');
    }
    setState(() {
      Navigator.pop(context);
      futureCatatan = fetchDaftarCatatan();
    });
  }

  Future<List<ListCatatan>> fetchDaftarCatatan() async {
    final response = await http.get('$DAFTAR_CATATAN');
    if (response.statusCode == 200) {
      if (response.body != 'false') {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<ListCatatan> produkList = [];
        for (final item in json['data']) {
          produkList.add(ListCatatan.fromJson(item));
        }
        return produkList;
      } else {
        return null;
      }
    } else {
      throw Exception('Gagal Menampilkan Daftar Catatan');
    }
  }

  Future<List<ListCatatan>> futureCatatan;

  @override
  void initState() {
    super.initState();
    futureCatatan = fetchDaftarCatatan();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ListCatatan>>(
      future: futureCatatan,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return DaftarKonten(
              snapshot: snapshot,
              ubahCatatan: ubahCatatan,
              hapusCatatan: hapusCatatan,
              tambahCatatan: tambahCatatan,
            );
          } else {
            return DaftarKosong(tambahCatatan: tambahCatatan);
          }
        }
        return Loading();
      },
    );
  }
}
