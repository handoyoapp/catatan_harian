import 'package:flutter/material.dart';

class SimpanCatatan extends StatelessWidget {
  SimpanCatatan({@required this.onPressedSimpan});
  final Function onPressedSimpan;
  
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        height: 45,
        decoration: BoxDecoration(color: Color(0xFF1761a0)),
        child: FlatButton(
          onPressed: () => onPressedSimpan(),
          child: Text(
            'Simpan',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}