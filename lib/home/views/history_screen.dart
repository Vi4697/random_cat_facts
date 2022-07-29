import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:random_cat_facts/database/fact_record.dart';
import 'package:random_cat_facts/database/services/CatFactsRecordsService.dart';
import 'package:random_cat_facts/home/bloc/rand_fact_bloc.dart';
import 'package:random_cat_facts/main.dart';
import 'package:random_cat_facts/networking/api_services/api_service.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

  final FactApiClient factApiClient = FactApiClient(Dio());

  final ImageApiClient imageApiClient = ImageApiClient(Dio());

  @override
  Widget build(BuildContext context) {
    recordsService.init();

    final List<FactRecord> records = recordsService.getRecords();

    return Scaffold(
        appBar: AppBar(
          title: Text("History"),
        ),
        body: Material(
          child: Container(
              color: Colors.lightGreen[300],
              child: ListView.separated(
                itemCount: records.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(records[index].text),
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              )),
        ));
  }
}
