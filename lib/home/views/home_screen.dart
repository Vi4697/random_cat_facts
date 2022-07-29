import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:random_cat_facts/home/bloc/rand_fact_bloc.dart';
import 'package:random_cat_facts/home/views/history_screen.dart';
import 'package:random_cat_facts/main.dart';
import 'package:random_cat_facts/networking/api_services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final FactApiClient factApiClient = FactApiClient(Dio());

  final ImageApiClient imageApiClient = ImageApiClient(Dio());

  @override
  Widget build(BuildContext context) {
    double imageHeight = 250;

    return Material(
      child: Container(
        color: Colors.lightGreen[300],
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      BlocBuilder<FactBloc, RandFactState>(
                          builder: (context, state) {
                        if (state is Loading) {
                          return Container(
                            padding: const EdgeInsets.only(
                              top: 50.0,
                            ),
                            margin: const EdgeInsets.only(
                              top: 90.0,
                              left: 50.0,
                              right: 50.0,
                            ),
                            height: imageHeight,
                            width: 300.0,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                alignment: Alignment.center,
                                matchTextDirection: true,
                                repeat: ImageRepeat.noRepeat,
                                image: AssetImage("assets/dancing-kitten.gif"),
                              ),
                              // color: Colors.black,
                              border: Border.all(
                                color: Colors.black,
                                width: 8,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        } else if (state is Loaded) {
                          print('image loaded');
                          return Container(
                            padding: const EdgeInsets.only(
                              top: 50.0,
                            ),
                            margin: const EdgeInsets.only(
                              top: 90.0,
                              left: 50.0,
                              right: 50.0,
                            ),
                            height: imageHeight,
                            width: 300.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(state.image.imageUrl),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.black,
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        } else if (state is Loading) {
                          return JumpingDotsProgressIndicator(
                            fontSize: 20.0,
                            color: Colors.white,
                          );
                        } else if (state is Failure) {
                          return const Text(
                            'An error occurred.',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                            softWrap: true,
                          );
                        } else {
                          return Container(
                            padding: const EdgeInsets.only(
                              top: 50.0,
                            ),
                            margin: const EdgeInsets.only(
                              top: 90.0,
                              left: 50.0,
                              right: 50.0,
                            ),
                            height: imageHeight,
                            width: 300.0,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                alignment: Alignment.center,
                                matchTextDirection: true,
                                repeat: ImageRepeat.noRepeat,
                                image: NetworkImage("https://cataas.com/cat"),
                              ),
                              color: Colors.black,
                              border: Border.all(
                                color: Colors.black,
                                width: 8,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                          );
                        }
                      }),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 40.0,
                          right: 30.0,
                          top: 10.0,
                        ),
                        child: BlocBuilder<FactBloc, RandFactState>(
                          builder: (context, state) {
                            if (state is Loading) {
                              return JumpingDotsProgressIndicator(
                                fontSize: 20.0,
                                color: Colors.white,
                              );
                            } else if (state is Loaded) {
                              return Text(
                                state.fact.fact,
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                                softWrap: true,
                              );
                            } else if (state is Failure) {
                              return const Text(
                                'An error occurred.',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                                softWrap: true,
                              );
                            } else {
                              return const Text(
                                'Generate a random fact by clicking on the button below.',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                softWrap: true,
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(
                          bottom: 0.0, left: 40.0, right: 40.0),
                      padding: const EdgeInsets.only(bottom: 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.blueAccent,
                                shadowColor: Colors.black,
                              ),
                              onPressed: () {
                                context
                                    .read<FactBloc>()
                                    .add(FactEventPressed());
                              },
                              child: const Text(
                                'Generate a Random Fact',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            width: 200,
                            height: 25.0,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const StadiumBorder(),
                                primary: Colors.amber,
                                shadowColor: Colors.black,
                              ),
                              onPressed: () {
                                //navigate
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HistoryScreen()),
                                );
                              },
                              child: const Text(
                                'Go To History..',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
