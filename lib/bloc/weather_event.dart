part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class LoadWeather extends WeatherEvent {}

class UpdateWeather extends WeatherEvent {
  final city;

  UpdateWeather(this.city);

  @override
  List<Object> get props => [city];
}
