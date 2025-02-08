// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatapaymentAdapter extends TypeAdapter<Data_payment> {
  @override
  final int typeId = 0;

  @override
  Data_payment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Data_payment(
      id: fields[0] as String,
      name: fields[1] as String,
      upid: fields[2] as String,
      createdtime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Data_payment obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.upid)
      ..writeByte(3)
      ..write(obj.createdtime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatapaymentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
