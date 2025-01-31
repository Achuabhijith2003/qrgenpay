import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymentqr/Screens/qrgen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 55,
        title: Text(
          "Home",
          style: GoogleFonts.akshar(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // button for create qr
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.amberAccent,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 5)
                    ]),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Qrgen()));
                      },
                      icon: Row(
                        children: [
                          Icon(
                            Icons.add,
                          ),
                          Text("Create Qr profile",
                              style: GoogleFonts.akshar(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ],
                      ),
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ) // enf button for create qr
        ],
      ),
    );
  }
}
