import 'package:weather_app/controller/dio_helper.dart';
import 'package:weather_app/models/current_weather_data.dart';
import 'package:weather_app/models/five_days_date.dart';

class WeatherService {
  String city;
  String baseUrl = 'api.openweathermap.org/data/2.5';
  String apiKey = 'appid=b5ea88ca9cd6b6d17965aeca6b367c99';

  WeatherService({required this.city});

  void getCurrentWeatherData({
    Function()? beforeSend,
    Function(Map<String, dynamic> error)? onError,
    Function(CurrentWeather currentWeather)? onSuccess,
  }) {
    final url = '$baseUrl/weather/q=$city&$apiKey';
    ApiRepo(url: url, payload: null).getData(
      beforeSend: () => beforeSend!(),
      onError: (error) => onError!(error),
      onSuccess: (data) => onSuccess!(CurrentWeather.fromJson(data)),
    );
  }

  void getFiveDaysThreeHoursForcastData({
    Function()? beforSend,
    Function(List<FiveDaysDate> fiveDayData)? onSuccess,
    Function(dynamic error)? onError,
  }) {
    final url = '$baseUrl/forecast?q=$city&lang=en&$apiKey';
    print(url);
    ApiRepo(
      url: '$url',
    ).getData(
        beforeSend: () => {},
        onSuccess: (data) => {
              onSuccess!((data['list'] as List)
                  .map((t) => FiveDaysDate.fromJson(t))
                  .toList())
            },
        onError: (error) => {
              print(error),
              onError!(error),
            });
  }
}
