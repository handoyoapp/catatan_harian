import 'package:catatan_harian/bantuan.dart';
import 'package:flutter/material.dart';

class TanggalCatatan extends StatelessWidget {
  TanggalCatatan({
    @required this.id,
    @required this.tanggal,
  });
  final int id;
  final String tanggal;

  @override
  Widget build(BuildContext context) {
    return Text(
      id == null
          ? 'Hari ini ${formatDateFromDateTime(DateTime.now())}'
          : tanggal.isNotEmpty
              ? formatDateFromString(tanggal)
              : formatDateFromDateTime(DateTime.now()),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 12,
        color: Colors.grey[400],
      ),
      textAlign: TextAlign.center,
    );
  }
}
