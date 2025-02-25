import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paymentqr/Componets/textfiled.dart';
import 'package:paymentqr/Screens/qrgen.dart';
import 'package:paymentqr/Servies/DB/trasationdata.dart';
import 'package:paymentqr/Servies/adsHelper.dart';
import 'package:upi_payment_qrcode_generator/upi_payment_qrcode_generator.dart';

class QrProfile extends StatefulWidget {
  final String name, upid, ids;
  const QrProfile(
      {super.key, required this.name, required this.upid, required this.ids});

  @override
  // ignore: no_logic_in_create_state
  State<QrProfile> createState() => _QrProfileState(name: name, upid: upid);
}

TextEditingController amountcontroller = TextEditingController();

class _QrProfileState extends State<QrProfile> {
  final String name;
  final String upid;

  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();

    // TODO: Load a banner ad
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  // @override
  // void dispose() {
  //   amountcontroller.dispose();
  //   amountcontroller.clear();
  //   super.dispose();
  // }

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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: SingleChildScrollView(
                child: transactionHistory(),
              ),
            ),
          ),
          if (_bannerAd != null)
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: _bannerAd!.size.width.toDouble(),
                height: _bannerAd!.size.height.toDouble(),
                child: AdWidget(ad: _bannerAd!),
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
                operation.addtransationhistory(
                    widget.ids, widget.name, amount, DateTime.now());
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

  Widget transactionHistory() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "Transaction History",
            style: GoogleFonts.akshar(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
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
                  // if (transaction.id != widget.ids) {
                  //   return Center(child: Text("No transaction available!"));
                  // }
                  if (transaction.id == widget.ids) {
                    return ListTile(
                      leading: Icon(Icons.transfer_within_a_station),
                      title: Text(transaction.amount
                          .toString()), // Correct way to access property
                      subtitle: Text(transaction
                          .transationid), // Correct way to access property
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
                  }
                  return Container();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
