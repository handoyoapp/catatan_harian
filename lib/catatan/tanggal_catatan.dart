import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TanggalCatatan extends StatelessWidget {
  TanggalCatatan({
    @required this.idList,
    @required this.tanggalList,
  });
  final int idList;
  final List<String> tanggalList;
  
  @override
  Widget build(BuildContext context) {
    String tanggalCatatan = DateFormat('EEEE, dd MMMM yyyy', 'id_ID').format(DateTime.now());
    return Text(
      idList == null
          ? 'Hari ini $tanggalCatatan'
          : '${tanggalList[idList]}',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.grey[400],
      ),
      textAlign: TextAlign.center,
    );
  }
}
