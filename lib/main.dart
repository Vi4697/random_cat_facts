import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_cat_facts/database/fact_record.dart';
import 'package:random_cat_facts/database/services/CatFactsRecordsService.dart';
import 'package:random_cat_facts/home/bloc/rand_fact_bloc.dart';
import 'package:random_cat_facts/home/views/home_screen.dart';
import 'package:random_cat_facts/networking/api_services/api_service.dart';
import 'package:random_cat_facts/networking/fact_repository.dart';
import 'package:random_cat_facts/networking/image_repository.dart';
import 'package:random_cat_facts/networking/responses/cat_img_response.dart';
import 'package:random_cat_facts/networking/responses/fact_response.dart';
import 'package:hive_flutter/hive_flutter.dart';

late Box box;
late CatFactsRecordsService recordsService = CatFactsRecordsService();

Future<void> main() async {
  await Hive.initFlutter();
  recordsService.init();

  final factRepository = FactRepository(factApiClient: FactApiClient(Dio()));
  final imageRepository =
      ImageRepository(imageApiClient: ImageApiClient(Dio()));
  // box = await Hive.openBox('appBox');
  // Hive.registerAdapter(FactRecordAdapter());

  runApp(MyApp(repository: factRepository, imageRepository: imageRepository));
}

class MyApp extends StatelessWidget {
  final FactRepository repository;
  final ImageRepository imageRepository;

  const MyApp(
      {Key? key, required this.repository, required this.imageRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Random Cats Here!"),
          ),
          body: RepositoryProvider.value(
            value: (context) {
              return [repository, imageRepository];
            },
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => FactBloc(
                    factRepository: repository,
                    imageRepository: imageRepository,
                  ),
                ),
              ],
              child: HomeScreen(),
            ),
          ),
        ));
  }
}
