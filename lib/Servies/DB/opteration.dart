import 'dart:math';

import 'package:paymentqr/Servies/DB/data.dart';
import 'package:paymentqr/main.dart';

class Operation {
  addpaymentdata(name, upid) {
    try {
      final ids = Random().nextInt(100000);
      print(ids);
      box.put(ids, Data_payment(id: "$ids", name: name, upid: upid));
    } catch (e) {
      print("Error in Adding paymentdata: $e");
    }
  }

  showpaymentdata() {
    try {
      final paymentdata = box.get(73926);
      print("Payment data : ${paymentdata}");
    } catch (e) {
      print("Error in Showing paymentdata: $e");
    }
  }
}
