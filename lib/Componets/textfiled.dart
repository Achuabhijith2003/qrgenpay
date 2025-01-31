import 'package:flutter/material.dart';

Widget textfiled(
    {required String hint,
    required TextEditingController controller,
    required TextInputType type,
    required bool obscure}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextField(
      controller: controller,
      keyboardType: type,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
