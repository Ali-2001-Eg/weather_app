class Coord {
  double? lon;
  double? lat;

  Coord({this.lon, this.lat});

  factory Coord.fromJson(Map<String, dynamic> json) => Coord(
        lon: json['lon'],
        lat: json['lat'],
      );

  Map<String, dynamic> toJson() {
    return {
      'lon': this.lon,
      'lat': this.lat,
    };
  }
}
