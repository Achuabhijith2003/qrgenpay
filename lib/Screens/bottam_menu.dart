import 'package:flutter/material.dart';
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
            selectedFontSize: 20,
            selectedItemColor: Colors.black,
            enableFeedback: true,
            backgroundColor: Color(
                int.parse("#f5f3ef".substring(1, 7), radix: 16) + 0xFF000000),
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    // color: Color(
                    //     int.parse("#f5f3ef".substring(1, 7), radix: 16) +
                    //         0xFF000000),
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.history,
                    // color: Color(
                    //     int.parse("#f5f3ef".substring(1, 7), radix: 16) +
                    //         0xFF000000),
                  ),
                  label: "Transaction"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    // color: Color(
                    //     int.parse("#f5f3ef".substring(1, 7), radix: 16) +
                    //         0xFF000000),
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
