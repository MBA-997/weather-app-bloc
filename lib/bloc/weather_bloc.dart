import 'package:bloc/bloc.dart';
import 'package:weather_app/providers/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:weather_app/weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;

  WeatherBloc({required this.weatherRepo}) : super(WeatherInitial()) {
    on<UpdateWeather>(((event, emit) async {
      await Future<void>.delayed(const Duration(seconds: 1));

      WeatherRepo weatherRepo = WeatherRepo();
      Weather weather = await weatherRepo.getCurrentWeather('Karachi');

      emit(WeatherUpdated(weather: weather));
    }));
  }

  // WeatherBloc({required this.weatherRepo}) : super(WeatherInitial()) {
  //   on<UpdateWeather>(((event, emit) async {
  //     try {
  //       Weather weather = await weatherRepo.getCurrentWeather('Karachi');
  //       emit(WeatherUpdated(weather: weather));
  //       // yield WeatherUpdated(weather);
  //     } catch (_) {
  //       print(_);
  //       emit(WeatherIsNotLoaded());
  //     }
  //   }));
}
