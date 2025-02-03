import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QrProfile extends StatefulWidget {
  const QrProfile(String name, String upid, {super.key});

  @override
  State<QrProfile> createState() => _QrProfileState();
}

class _QrProfileState extends State<QrProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 5,
        title: Text(
          "widget.name",
          style: GoogleFonts.akshar(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
    );
  }
}
