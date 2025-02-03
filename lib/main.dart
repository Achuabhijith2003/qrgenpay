import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paymentqr/Servies/DB/data.dart';
import 'package:paymentqr/splash.dart';

late Box box;
void main(List<String> args) async{
  WidgetsFlutterBinding.ensureInitialized();
   // hive init
  await Hive.initFlutter();
  Hive.registerAdapter(DatapaymentAdapter());

  box = await Hive.openBox('payment_qr_data');
  runApp(const qrgenpay());
}

class qrgenpay extends StatelessWidget {
  const qrgenpay({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}
