import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paymentqr/Screens/qr_profile.dart';
import 'package:paymentqr/Screens/qrgen.dart';
import 'package:paymentqr/Servies/DB/data.dart';
import 'package:paymentqr/Servies/adsHelper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        elevation: 5,
        title: Text(
          "Home",
          style: GoogleFonts.akshar(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Profiles",
            style: GoogleFonts.akshar(
                color: Colors.amberAccent,
                fontWeight: FontWeight.bold,
                fontSize: 50),
          ),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: Hive.box("payment_qr_data").listenable(),
              builder: (context, box, child) {
                if (box.isEmpty) {
                  return Center(child: Text("No profile available!"));
                }
                return ListView.builder(
                  itemCount: box.length,
                  shrinkWrap: true, // Ensures proper height calculation
                  itemBuilder: (context, index) {
                    var profile = box.getAt(index)
                        as Data_payment; // Cast to Data_payment
                    return ListTile(
                      leading: Icon(Icons.qr_code),
                      title:
                          Text(profile.name), // Correct way to access property
                      subtitle:
                          Text(profile.upid), // Correct way to access property
                      trailing: IconButton(
                        //delete button
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          box.deleteAt(index);
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QrProfile(
                                      name: profile.name,
                                      upid: profile.upid,
                                      ids: profile.id,
                                    ))); // Pass name and upid
                      },
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Qrgen()));
              },
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              label: Text(
                "Create Qr profile",
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
}
