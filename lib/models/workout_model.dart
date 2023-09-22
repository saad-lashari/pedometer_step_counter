
class WorkoutModel{
  String? date;
  String? distance;
  Duration? minutes;

  WorkoutModel({this.date, this.distance, this.minutes});

  factory WorkoutModel.fromJson(map) {
    return WorkoutModel(
      date: map['date'],
      distance: map['distance'] ?? '',
      minutes: map['minutes'] ?? '',
    );
  }
  toJson() {
    return {
      "date": date,
      "distance": distance,
      "minutes": minutes
    };
  }
}