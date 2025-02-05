import 'package:paymentqr/Servies/DB/data.dart';
import 'package:paymentqr/main.dart';
import 'package:uuid/uuid.dart';

class Operation {
  addpaymentdata(name, upid) {
    try {
      const uuid = Uuid();
      final ids = uuid.v1();
      // print("UID: $ids");
      box.put(ids, Data_payment(id: ids, name: name, upid: upid));
    } catch (e) {
      // print("Error in Adding paymentdata: $e");
    }
  }

  showpaymentdata() {
    try {
      // final paymentdata = box.get("7795e140-e3e2-11ef-afc9-2d6747940557");
      // print("Payment data : ${paymentdata.name}");
    } catch (e) {
      // print("Error in Showing paymentdata: $e");
    }
  }
}
