import 'package:hive/hive.dart';

part 'fact_record.g.dart';

@HiveType(typeId: 1)
class FactRecord {
  FactRecord(
      {required this.creationDateTime, required this.id, required this.text});
  @HiveField(0)
  int id;

  @HiveField(1)
  String text;

  @HiveField(2)
  int creationDateTime;
}
