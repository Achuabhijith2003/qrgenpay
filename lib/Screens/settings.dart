import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          elevation: 55,
        title: Text(
          "Settings",
          style: GoogleFonts.akshar(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
