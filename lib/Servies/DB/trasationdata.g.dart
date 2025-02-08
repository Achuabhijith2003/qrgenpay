// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trasationdata.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TransationdataAdapter extends TypeAdapter<Transation_data> {
  @override
  final int typeId = 1;

  @override
  Transation_data read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Transation_data(
      id: fields[0] as String,
      transationid: fields[1] as String,
      amount: fields[2] as String,
      createdtime: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Transation_data obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.transationid)
      ..writeByte(2)
      ..write(obj.amount)
      ..writeByte(3)
      ..write(obj.createdtime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TransationdataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
