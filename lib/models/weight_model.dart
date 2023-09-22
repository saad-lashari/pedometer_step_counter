class WeightModel {
  num? weight;
  String? dateTime;

  WeightModel({this.weight, this.dateTime});

  factory WeightModel.fromJson(map) {
    return WeightModel(
      weight: map['weight'],
      dateTime: map['dateTime'] ?? '',
    );
  }
  toJson() {
    return {
      "weight": weight,
      "dateTime": dateTime,
    };
  }
}


