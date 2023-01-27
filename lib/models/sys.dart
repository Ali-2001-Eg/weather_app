class Sys {
  /*"type": 1,
    "id": 2514,
    "country": "EG",
    "sunrise": 1661225216,
    "sunset": 1661272133*/
  int? id, type, sunrice, sunset;
  String? country;

  Sys({this.id, this.type, this.sunrice, this.sunset, this.country});

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      id: int.parse(json["id"]),
      type: json["type"],
      sunrice: json["sunrice"],
      sunset: json["sunset"],
      country: json["country"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "type": this.type,
      "sunrice": this.sunrice,
      "sunset": this.sunset,
      "country": this.country,
    };
  }
//

}
