// d59171b6d434099be4100815231002

class Weather {
  final String city;
  final String country;
  // final DateTime date;
  final DateTime lastUpdated;
  final String tempCel;
  final String name;
  final String humidity;
  final String feelsLike;
  final String uv;

  Weather({
    required this.city,
    required this.country,
    // required this.date,
    required this.lastUpdated,
    required this.tempCel,
    required this.name,
    required this.humidity,
    required this.feelsLike,
    required this.uv,
  }) : super();

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        city: json['location']['name'],
        country: json['location']['country'],
        lastUpdated: DateTime.parse(
            json['current']['last_updated'].substring(0, 12) +
                "0" +
                json['current']['last_updated']
                    .substring(13, json['current']['last_updated'].length) +
                ":00"),
        tempCel: json['current']['temp_c'].toString(),
        name: json['current']['condition']['text'],
        humidity: json['current']['humidity'].toString(),
        feelsLike: json['current']['feelslike_c'].toString(),
        uv: json['current']['uv'].toString());
  }

  @override
  List<Object> get props =>
      [city, country, lastUpdated, tempCel, name, humidity, uv, feelsLike];
}
