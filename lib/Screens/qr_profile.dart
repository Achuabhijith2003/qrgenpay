import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paymentqr/Componets/textfiled.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class QrProfile extends StatefulWidget {
  final String name, upid;
  const QrProfile({super.key, required this.name, required this.upid});

  @override
  // ignore: no_logic_in_create_state
  State<QrProfile> createState() => _QrProfileState(name: name, upid: upid);
}

TextEditingController amountcontroller = TextEditingController();

class _QrProfileState extends State<QrProfile> {
  final String name;
  final String upid;

  _QrProfileState({required this.name, required this.upid});
  @override
  Widget build(BuildContext context) {
    late double value;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 5,
        title: Text(
          widget.name,
          style: GoogleFonts.akshar(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          textfiled(
              hint: "Enter the Amount",
              controller: amountcontroller,
              type: TextInputType.number,
              obscure: false),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton.icon(
              onPressed: () {
                try {
                  value = double.parse(amountcontroller.text.trim());
                  if (value <= 0) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Please enter a valid amount"),
                      ),
                    );
                  } else {
                    value = double.parse(amountcontroller.text.trim());
                    showModalBottomSheet(
                      isDismissible: false,
                      context: context,
                      builder: (context) {
                        return generateqr(value);
                      },
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Please enter a valid amount"),
                    ),
                  );
                }
              },
              icon: Icon(
                Icons.qr_code,
                color: Colors.white,
              ),
              label: Text(
                "Generate QR code",
                style: GoogleFonts.akshar(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amberAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget generateqr(amount) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Scan the QR code to pay",
            style: GoogleFonts.akshar(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20)),
        UPIPaymentQRCode(
          upiDetails: UPIDetails(
              upiID: widget.upid, payeeName: widget.name, amount: amount),
          size: 220,
          upiQRErrorCorrectLevel: UPIQRErrorCorrectLevel.low,
          embeddedImagePath: "assets/Best UPI Payment Apps in India 2019.jpeg",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                amountcontroller.clear();
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              label: Text(
                "Confirm",
                style: GoogleFonts.akshar(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
              label: Text(
                "Cancel",
                style: GoogleFonts.akshar(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
