import 'package:weather_app/models/clouds.dart';
import 'package:weather_app/models/coord.dart';
import 'package:weather_app/models/five_days_date.dart';
import 'package:weather_app/models/main.dart';
import 'package:weather_app/models/sys.dart';
import 'package:weather_app/models/wind.dart';

class CurrentWeather {
  Coord? coord;
  dynamic weather;
  Sys? sys;
  Wind? wind;
  Clouds? clouds;
  FiveDaysDate? fiveDaysDate;
  MainWeather? mainWeather;
  String? base;
  int? id;
  int? timezone;
  String? name;
  int? cod;

  CurrentWeather(
      {this.coord,
      this.weather,
      this.sys,
      this.wind,
      this.clouds,
      this.fiveDaysDate,
      this.mainWeather,
      this.base,
      this.id,
      this.timezone,
      this.name,
      this.cod});

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      coord: Coord.fromJson(json["coord"]),
      weather: List.of(json["weather"])
          .map((i) => i /* can't generate it properly yet */)
          .toList(),
      sys: Sys.fromJson(json["sys"]),
      wind: Wind.fromJson(json["wind"]),
      clouds: Clouds.fromJson(json["clouds"]),
      fiveDaysDate: FiveDaysDate.fromJson(json["fiveDaysDate"]),
      mainWeather: MainWeather.fromJson(json["mainWeather"]),
      base: json["base"],
      id: int.parse(json["id"]),
      timezone: int.parse(json["timezone"]),
      name: json["name"],
      cod: int.parse(json["cod"]),
    );
  }
//

}
