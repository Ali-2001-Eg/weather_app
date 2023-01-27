class FiveDaysDate {
  String? dateTime;
  int? temp;

  FiveDaysDate({this.dateTime, this.temp});

  factory FiveDaysDate.fromJson(Map<String, dynamic> json) {
    return FiveDaysDate(
      dateTime: json["dateTime"],
      temp: int.parse(json["temp"]),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "dateTime": this.dateTime,
      "temp": this.temp,
    };
  }
//

}
