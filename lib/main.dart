import 'package:flutter/material.dart';
import 'package:paymentqr/splash.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
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
