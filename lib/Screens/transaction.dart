import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paymentqr/Servies/DB/trasationdata.dart';

class TransactionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 55,
        title: Text(
          "Transaction",
          style: GoogleFonts.akshar(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text(
            //   "Transaction History",
            //   style: GoogleFonts.akshar(
            //     color: Colors.black,
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //   ),
            // ),
            ValueListenableBuilder(
              valueListenable:
                  Hive.box("payment_qr_transtaionhistory").listenable(),
              builder: (context, box, child) {
                if (box.isEmpty) {
                  return Center(child: Text("No transaction available!"));
                }
                return ListView.builder(
                  itemCount: box.length,
                  shrinkWrap: true, // Ensures proper height calculation
                  physics:
                      NeverScrollableScrollPhysics(), // Prevents ListView from scrolling
                  itemBuilder: (context, index) {
                    var transaction = box.getAt(index)
                        as Transation_data; // Cast to Transation_data
                    return ListTile(
                      leading: Icon(Icons.transfer_within_a_station),
                      title: Text(
                          transaction.name), // Correct way to access property
                      subtitle: Text(
                          transaction.amount), // Correct way to access property
                      trailing: Text(
                          "${transaction.createdtime.day}-${transaction.createdtime.month}-${transaction.createdtime.year}"), // date
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => QrProfile(
                        //               name: profile.name,
                        //               upid: profile.upid,
                        //               ids: profile.id,
                        //             ))); // Pass name and upid
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
