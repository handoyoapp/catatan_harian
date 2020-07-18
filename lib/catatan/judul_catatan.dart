import 'package:flutter/material.dart';

class JudulCatatan extends StatelessWidget {
  JudulCatatan({@required this.judulController});
  final TextEditingController judulController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: TextField(
        style: TextStyle(
          color: Colors.grey[800],
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        controller: judulController,
        decoration: InputDecoration(
          hintText: 'Tulis judul di sini...',
          hintStyle: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
          contentPadding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 24,
            bottom: 8,
          ),
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.text,
        maxLines: null,
      ),
    );
  }
}
