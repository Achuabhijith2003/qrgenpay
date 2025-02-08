import 'package:hive/hive.dart';

part 'data.g.dart';

@HiveType(typeId: 0)
// ignore: camel_case_types
class Data_payment {
  Data_payment({
    required this.id,
    required this.name,
    required this.upid,
    required this.createdtime,
  });
  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String upid;
  @HiveField(3)
  DateTime createdtime;
}




