import 'package:flutter/material.dart';

class IsiCatatan extends StatelessWidget {
  IsiCatatan({@required this.catatanController});
  final TextEditingController catatanController;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        style: TextStyle(color: Colors.grey[700], fontSize: 14),
        controller: catatanController,
        decoration: InputDecoration(
          hintText: 'Tulis catatan di sini...',
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.only(left: 8, right: 8, top: 12, bottom: 12),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
        maxLines: null,
        textInputAction: TextInputAction.newline,
      ),
    );
  }
}