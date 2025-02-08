import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paymentqr/Servies/DB/data.dart';
import 'package:paymentqr/Servies/DB/trasationdata.dart';
import 'package:paymentqr/splash.dart';

late Box box, boxtra;
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // hive init
  await Hive.initFlutter();
  Hive.registerAdapter(DatapaymentAdapter());
  Hive.registerAdapter(TransationdataAdapter());

  box = await Hive.openBox('payment_qr_data');
  boxtra = await Hive.openBox('payment_qr_transtaionhistory');
  runApp(const qrgenpay());
}

// ignore: camel_case_types
class qrgenpay extends StatelessWidget {
  const qrgenpay({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}
