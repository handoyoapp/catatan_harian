import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DaftarCatatan extends StatelessWidget {
  DaftarCatatan({
    @required this.index,
    @required this.tanggalList,
    @required this.judulList,
    @required this.catatanList,
  });
  final int index;
  final List<String> tanggalList;
  final List<String> judulList;
  final List<String> catatanList;

  void bagikanCatatan(int index) {
    Share.share( '${tanggalList[index]}\n${judulList[index]}\n${catatanList[index]}');
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
                '${tanggalList[index]}',
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              SizedBox(height: 3),
              Text(
                '${judulList[index]}',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '${catatanList[index]}',
                style: TextStyle(color: Colors.grey[700], fontSize: 14),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
        InkWell(
          onTap: () => bagikanCatatan(index),
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
