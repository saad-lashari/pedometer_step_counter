import 'dart:async';
import 'dart:developer';
import 'package:cypherkicks/data/local_db/local_db.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pedometer/pedometer.dart';
import '../../models/steps_data_model.dart';

class PedometerController extends GetxController {
  List<StepsData> weekSteps = [
    StepsData('Fri', 0),
    StepsData('Sat', 0),
    StepsData('Sun', 0),
    StepsData('Mon', 0),
    StepsData('Tue', 0),
    StepsData('Wed', 0),
    StepsData('Thu', 0),
  ];
  //final Pedometer _pedometer = Pedometer();
  late StreamSubscription<StepCount> _stepCountSubscription;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  int currentStepCount = 0;

  int _totalSteps = 0;
  String burnedCalories = '';
  String earnedToken = '';
  String miles = '';

  String _lastdate = '';

  @override
  void onInit() async {
    _totalSteps = await LocalDatabase().getlaststeps();
    _lastdate = await LocalDatabase().getlastdate();
    if (_lastdate.isEmpty) {
      _lastdate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      log("Current date=====>$_lastdate");
      LocalDatabase().setlastdate(_lastdate);
    }
    log("last date ========>$_lastdate");
    super.onInit();
    _startListening();
  }

  @override
  void onClose() {
    _stopListening();
    super.onClose();
  }

  void _startListening() {
    _stepCountSubscription = Pedometer.stepCountStream.listen(_onStepCount);
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream.listen(onPedestrianStatusChanged);

    update();
  }

  void clear() {
    weekSteps.clear();
    update();
  }

  void _stopListening() {
    _stepCountSubscription.cancel();
    update();
  }

  void onPedestrianStatusChanged(PedestrianStatus event) async {
    if (event.status == 'stopped') {
      await LocalDatabase().setDaySteps(currentStepCount);
    }
    // log(_status);
  }

  void _onStepCount(StepCount stepCount) async {
    String streamdate = DateFormat('yyyy-MM-dd').format(stepCount.timeStamp);
    _checkDateChange(streamdate, stepCount.steps);

    currentStepCount = stepCount.steps - _totalSteps;

    earnedToken = _tokens(currentStepCount);
    burnedCalories = _caloriesBurned(currentStepCount);
    miles = _steptoMiles(currentStepCount);
    update();
  }

  void _checkDateChange(String date, int totalSteps) {
    if (_lastdate != date) {
      _totalSteps = totalSteps;
      LocalDatabase().settStreamsteps(currentStepCount);
      _saveStepsForPreviousDay();
      currentStepCount = 0;
      _lastdate = date;
      LocalDatabase().setlastdate(_lastdate);
    }
  }

  void _saveStepsForPreviousDay() async {
    // log('Steps for $_lastdate: $currentStepCount');
    int steps = await LocalDatabase().getDaysteps();
    log('saved steps======> $steps');
    String day = _datetoDayconvert(_lastdate);

    log('Steps for $day: $currentStepCount');

    weekSteps.add(StepsData(day, currentStepCount.toDouble()));
    update();
  }

  // date to day converter Extract the first three letters
  String _datetoDayconvert(String dateString) {
    DateTime date = DateTime.parse(dateString);
    String weekDay = DateFormat.E().format(date);
    String abbreviatedWeekDay =
        weekDay.substring(0, 3); // Extract the first three letters
    return abbreviatedWeekDay;
  }

// calories count method
  String _caloriesBurned(int steps) {
    double caloriesBurned = steps * 0.04;
    String roundedvalue = caloriesBurned.toStringAsFixed(2);

    return roundedvalue;
  }

//miles count method
  String _steptoMiles(int steps) {
    double miles = steps * (0.414 / 1000);
    String roundedvalue = miles.toStringAsFixed(2);

    return roundedvalue;
  }

// tokens count method
  String _tokens(int steps) {
    double token = steps * 0.04;
    String roundedvalue = token.toStringAsFixed(2);

    return roundedvalue;
  }
}
