import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/features/clima/presentation/bloc/weather_bloc_bloc.dart';
import 'package:weather_app/features/clima/presentation/views/helpers/background.dart';
import 'package:weather_app/features/clima/presentation/views/helpers/row_weather_infos.dart';
import 'package:weather_app/features/clima/presentation/views/helpers/weather_icons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const Background(
                x: 3,
                y: -0.3,
                height: 300,
                width: 300,
                color: Color.fromARGB(255, 6, 243, 219),
              ),
              const Background(
                x: -3,
                y: -0.3,
                height: 300,
                width: 300,
                color: Color.fromARGB(255, 55, 41, 80)  ),
              const Background(
                x: 0,
                y: -1.2,
                height: 250,
                width: 250,
                color: Colors.blueGrey,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 100.0,
                  sigmaY: 100.0,
                ),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                if (state is WeatherBlocSuccess) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10.0),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            Text(
                              '${state.weather.areaName}, ${state.weather.country}',
                              style: setTextStyleHomeScreenInfos(
                                  20, Colors.grey[400]!),
                            ),
                            const SizedBox(width: 5.0),
                          ],
                        ),
                        getWeatherIcon(state.weather.weatherConditionCode!),
                        Center(
                          child: Text(
                            '${state.weather.temperature!.celsius!.round()}°C',
                            style:
                                setTextStyleHomeScreenInfos(55, Colors.white),
                          ),
                        ),
                        Center(
                          child: Text(
                            state.weather.weatherDescription!.toUpperCase(),
                            style:
                                setTextStyleHomeScreenInfos(25, Colors.white),
                          ),
                        ),
                        const SizedBox(height: 5.0),
                        Center(
                          child: Text(
                            DateFormat('EEEE dd •')
                                .add_jm()
                                .format(state.weather.date!),
                            // 'Sexta 16 - 09.41am'
                            style: setTextStyleHomeScreenInfos(16, Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RowWeatherInfos(
                              description: 'Sunrise',
                              assetPath: 'assets/11.png',
                              date: DateFormat()
                                  .add_jm()
                                  .format(state.weather.sunrise!),
                            ),
                            RowWeatherInfos(
                              description: 'Sunset',
                              assetPath: 'assets/12.png',
                              date: DateFormat()
                                  .add_jm()
                                  .format(state.weather.sunset!),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RowWeatherInfos(
                              description: 'Temp Max',
                              assetPath: 'assets/13.png',
                              date:
                                  '${state.weather.tempMax!.celsius!.round()}°C',
                            ),
                            RowWeatherInfos(
                              description: 'Temp Min',
                              assetPath: 'assets/14.png',
                              date:
                                  '${state.weather.tempMin!.celsius!.round()}°C',
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
