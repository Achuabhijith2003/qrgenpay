import 'package:paymentqr/Servies/DB/data.dart';
import 'package:paymentqr/Servies/DB/trasationdata.dart';
import 'package:paymentqr/main.dart';
import 'package:uuid/uuid.dart';

class Operation {
  addpaymentdata(name, upid) {
    try {
      const uuid = Uuid();
      final ids = uuid.v1();
      // print("UID: $ids");
      box.put(
          ids,
          Data_payment(
              id: ids, name: name, upid: upid, createdtime: DateTime.now()));
    } catch (e) {
      // print("Error in Adding paymentdata: $e");
    }
  }

  addtransationhistory(ids, amount, createdtime) {
    try {
      const uuid = Uuid();
      final transationids = uuid.v1();
      boxtra.put(
          "$transationids",
          Transation_data(
              id: ids,
              transationid: transationids,
              amount: "$amount",
              createdtime: createdtime));
    } catch (e) {
      print("Error in Adding transationhistory: $e");
    }
  }

  //  Error in Adding transationhistory: type 'double' is not a subtype of type 'String'

  showpaymentdata() {
    try {
      // final paymentdata = box.get("7795e140-e3e2-11ef-afc9-2d6747940557");
      // print("Payment data : ${paymentdata.name}");
    } catch (e) {
      // print("Error in Showing paymentdata: $e");
    }
  }
}
