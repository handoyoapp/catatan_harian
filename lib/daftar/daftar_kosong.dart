import 'package:flutter/material.dart';

class DaftarKosong extends StatelessWidget {
  DaftarKosong({@required this.tambahCatatan});
  final Function tambahCatatan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catatan Harian'),
        backgroundColor: Color(0xFF1761a0),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Belum ada catatan',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
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
