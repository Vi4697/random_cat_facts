// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fact_record.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FactRecordAdapter extends TypeAdapter<FactRecord> {
  @override
  final int typeId = 1;

  @override
  FactRecord read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FactRecord(
      creationDateTime: fields[2] as int,
      id: fields[0] as int,
      text: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FactRecord obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.creationDateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FactRecordAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
