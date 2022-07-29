import 'package:hive_flutter/hive_flutter.dart';
import 'package:random_cat_facts/database/fact_record.dart';

class CatFactsRecordsService {
  late Box<FactRecord> _factRecords;

  Future<void> init() async {
    Hive.registerAdapter(FactRecordAdapter());
    _factRecords = await Hive.openBox("factRecords");
  }

  List<FactRecord> getRecords() {
    final records = _factRecords.values;

    return records.toList();
  }

  void addTask(final FactRecord factRecord) {
    _factRecords.add(factRecord);
  }
}
