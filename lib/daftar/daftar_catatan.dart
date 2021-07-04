import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DaftarCatatan extends StatelessWidget {
  DaftarCatatan({
    @required this.tanggal,
    @required this.judul,
    @required this.catatan,
  });
  final String tanggal;
  final String judul;
  final String catatan;

  void bagikanCatatan() {
    Share.share( '$tanggal\n$judul\n$catatan');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Text(
                '$tanggal',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              SizedBox(height: 3),
              Text(
                '$judul',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '$catatan',
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        InkWell(
          onTap: () => bagikanCatatan(),
          child: Icon(
            Icons.share,
            color: Colors.grey[350],
            size: 18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.grey[350],
            size: 18,
          ),
        ),
      ],
    );
  }
}
