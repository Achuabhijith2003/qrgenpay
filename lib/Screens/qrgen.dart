import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymentqr/Componets/textfiled.dart';
import 'package:paymentqr/Servies/DB/opteration.dart';

class Qrgen extends StatefulWidget {
  const Qrgen({super.key});

  @override
  State<Qrgen> createState() => _QrgenState();
}

Operation operation = Operation();

TextEditingController namecontroller = TextEditingController();
TextEditingController upicontroller = TextEditingController();

class _QrgenState extends State<Qrgen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 55,
        title: Text(
          "Create Qr profile",
          style: GoogleFonts.akshar(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          textfiled(
              hint: "Name",
              controller: namecontroller,
              type: TextInputType.name,
              obscure: false),
          textfiled(
              hint: "UPI ID",
              controller: upicontroller,
              type: TextInputType.name,
              obscure: false),
          // textfiled(
          // hint: "Name",
          // controller: controller,
          // type: TextInputType.name,
          // obscure: false)
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.amberAccent),
            width: MediaQuery.of(context).size.width * .9,
            height: 55,
            child: TextButton(
                onPressed: () {
                  createqr(namecontroller, upicontroller);
                  Navigator.of(context).pop();
                },
                child: Text("Create QR Profile",
                    style: GoogleFonts.akshar(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))),
          ),
        ],
      ),
    );
  }

  createqr(TextEditingController namecontroller,
      TextEditingController upicontroller) {
    String name = namecontroller.text.trim();
    String upi = upicontroller.text.trim();
    if (name.isEmpty || upi.isEmpty) {
      _showAlertDialog(context);
      return;
    }
    operation.addpaymentdata(name, upi);
    // operation.showpaymentdata();
    // String qrdata = "upi://pay?name=$name&pa=$upi";
    // return qrdata;
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alert'),
          content: Text('Fill the blanks.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
