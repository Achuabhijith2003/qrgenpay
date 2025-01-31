import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymentqr/Screens/home.dart';
import 'package:paymentqr/Screens/settings.dart';
import 'package:paymentqr/Screens/transaction.dart';

class BottamMenu extends StatefulWidget {
  const BottamMenu({super.key});

  @override
  State<BottamMenu> createState() => _BottamMenuState();
}

class _BottamMenuState extends State<BottamMenu> {
  int _cureentindex = 0;

  List<Widget> body = const [Home(), Transaction(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: body[_cureentindex]),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomNavigationBar(
            selectedLabelStyle: GoogleFonts.akshar(),
            unselectedLabelStyle: GoogleFonts.akshar(),
            selectedFontSize: 20,
            selectedItemColor: Colors.white,
            enableFeedback: true,
            backgroundColor: Colors.amberAccent,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                  ),
                  label: "Transaction"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "Settings"),
            ],
            currentIndex: _cureentindex,
            onTap: (value) {
              setState(() {
                _cureentindex = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
