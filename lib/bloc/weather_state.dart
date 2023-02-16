part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherUpdated extends WeatherState {
  final Weather weather;

  const WeatherUpdated({required this.weather});

  Weather get getWeather => weather;

  @override
  List<Object> get props => [weather];
}

class WeatherIsNotLoaded extends WeatherState {}
