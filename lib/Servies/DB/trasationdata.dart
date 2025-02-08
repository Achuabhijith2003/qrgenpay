import 'package:hive/hive.dart';

part 'trasationdata.g.dart';

@HiveType(typeId: 1)
// ignore: camel_case_types
class Transation_data {
  Transation_data({
    required this.id,
    required this.transationid,
    required this.amount,
    required this.createdtime,
  });
  @HiveField(0)
  String id;
  @HiveField(1)
  String transationid;
  @HiveField(2)
  String amount;
  @HiveField(3)
  DateTime createdtime;
}
