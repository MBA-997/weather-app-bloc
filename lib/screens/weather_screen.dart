import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen() : super();

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  // Weather? weather;
  var loading = true;
  var city = 'Karachi';

  TextEditingController _controllerCity = TextEditingController();

  @override
  void dispose() {
    _controllerCity.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _getCurrentWeather();

    final weatherBloc = BlocProvider.of<WeatherBloc>(context);

    return Scaffold(
      drawer: const Drawer(),
      body: Center(
        child: BlocBuilder<WeatherBloc, WeatherState>(
          builder: (context, state) {
            if (state is WeatherInitial) {
              weatherBloc.add(UpdateWeather('Karachi'));

              return CircularProgressIndicator();
            }
            if (state is WeatherUpdated) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.weather.name.toString(),
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      Text(
                        state.weather.tempCel.toString().substring(0, 2) + " C",
                        style: const TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Text(
                    state.weather.city.toString() +
                        " " +
                        state.weather.country.toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Humidity " + state.weather.humidity.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "UV " + state.weather.uv.toString(),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Last Updated: " +
                        state.weather.lastUpdated.toString().substring(11, 16),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.replay_rounded,
                    ),
                    onPressed: () {
                      weatherBloc.add(UpdateWeather('Karachi'));
                      // _getCurrentWeather();
                    },
                  )
                ],
              );
            } else {
              return const Center(child: Text('Something Went Wrong'));
            }
          },
        ),
      ),
    );
  }
}
