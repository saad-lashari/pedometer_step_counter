class StepsData {
  StepsData(this.days, this.steps);

  String? days;
  double? steps;

  Map<String, dynamic> toJson() {
    return {
      'days': days,
      'steps': steps,
    };
  }

  factory StepsData.fromJson(Map<String, dynamic> json) {
    return StepsData(
      json['days'],
      json['steps'],
    );
  }
}
