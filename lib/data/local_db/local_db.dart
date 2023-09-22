import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:cypherkicks/data/controllers/profile_controller.dart';
import 'package:cypherkicks/data/controllers/steps_controller.dart';
import 'package:cypherkicks/data/controllers/weight_controller.dart';
import 'package:cypherkicks/models/steps_data_model.dart';
import 'package:cypherkicks/models/weight_model.dart';
import 'package:cypherkicks/models/workout_model.dart';
import 'package:cypherkicks/utils/dashboard_utils/dashboard_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDatabase {
  // saveWeightListLocally(List<WeightModel> weights) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final mapList =
  //       WeightController.i.weight.map((weight) => weight.toJson()).toList();

  //   prefs.setString('weight-list', jsonEncode(mapList));
  // }

  // getWeightList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? weightListStr = prefs.getString('weight-list') ?? '[]';
  //   List mapList = await jsonDecode(weightListStr);
  //   List<WeightModel> weightList =
  //       mapList.map<WeightModel>((map) => WeightModel.fromJson(map)).toList();

  //   return weightList;
  // }

  // savedailysteps(int steps) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setInt('stepcount', steps);
  // }

  // getDailySteps() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   StepsController.i.preservedvalue = prefs.getInt('stepcount') ?? 0;
  // }

  // saveStepsList(List<StepsDataModel> list) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   List mapList = list.map((list) => list.toJson()).toList();

  //   prefs.setString('steps', jsonEncode(mapList));
  // }

  // getStepsList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? stepsListstr = prefs.getString('steps') ?? '[]';
  //   List mapList = await jsonDecode(stepsListstr);

  //   StepsController.i.stepsList = mapList
  //       .map<StepsDataModel>((map) => StepsDataModel.fromJson(map))
  //       .toList();
  // }

  // saveProfileData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('image', ProfileController.i.file!.path);
  //   prefs.setString('nickname', ProfileController.i.nickname.text);
  //   prefs.setString('address', ProfileController.i.address.text);
  //   prefs.setString('username', ProfileController.i.username.text);
  //   prefs.setString('country', ProfileController.i.country.text);
  // }

  // getProfileData() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   // String? file = prefs.getString('image');

  //   ProfileController.i.nickname.text = prefs.getString('nickname') ?? '';
  //   ProfileController.i.address.text = prefs.getString('address') ?? '';
  //   ProfileController.i.username.text = prefs.getString('username') ?? '';
  //   ProfileController.i.country.text = prefs.getString('country') ?? '';
  //   // ProfileController.i.file = File(file!);
  // }

  // saveDate(String date) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('date', date);
  // }

  // getDate() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   StepsController.currentDate = DashBoardUtils().toDateTime(
  //         prefs.getString('date'),
  //       ) ??
  //       DateTime.now();
  // }

  // saveDuratiom() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setInt('duration', WorkoutController.i.duration.inSeconds);
  // }

  // Future<Duration> getDuration() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   int duration = prefs.getInt('duration') ?? 0;
  //   return Duration(seconds: duration);
  // }

  // saveWorkoutList(List<WorkoutModel> list) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   List mapList = list.map((list) => list.toJson()).toList();

  //   prefs.setString('workoutlist', jsonEncode(mapList));
  // }

  // getWorkoutList() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   String? workoutList = prefs.getString('workoutlist') ?? '[]';
  //   List mapList = await jsonDecode(workoutList);

  //   StepsController.i.workoutList =
  //       mapList.map<WorkoutModel>((map) => WorkoutModel.fromJson(map)).toList();
  // }

  Future settStreamsteps(
    int steps,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('steps', steps);
  }

  Future<int> getlaststeps() async {
    final prefs = await SharedPreferences.getInstance();
    int steps = prefs.getInt('steps') ?? 0;

    // log(steps);
    return steps;
  }

  Future setDaySteps(
    int steps,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('lastdaysteps', steps);
  }

  Future<int> getDaysteps() async {
    final prefs = await SharedPreferences.getInstance();
    int steps = prefs.getInt('lastdaysteps') ?? 0;

    // log(steps);
    return steps;
  }

  Future setlastdate(String date) async {
    //  log(date);
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('date', date);
  }

  Future<String> getlastdate() async {
    final prefs = await SharedPreferences.getInstance();
    String date = prefs.getString('date') ?? '';

    // log(steps);
    return date;
  }

  Future setFri(String day, int steps) async {
    log('Friday');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('fri', steps);
    prefs.setInt('friSteps', steps);
  }

  Future setSat(String day, int steps) async {
    log('Saturday');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('sat', steps);
    prefs.setInt('satSteps', steps);
  }

  Future setSun(String day, int steps) async {
    log('sunday');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('sun', steps);
    prefs.setInt('sunSteps', steps);
  }

  Future setMon(String day, int steps) async {
    log('Monday');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('mon', steps);
    prefs.setInt('satMon', steps);
  }

  Future setTue(String day, int steps) async {
    log('tuesday');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('sat', steps);
    prefs.setInt('satSteps', steps);
  }

  Future setWed(String day, int steps) async {
    log('wednessday');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('wed', steps);
    prefs.setInt('wedSteps', steps);
  }

  Future setThu(String day, int steps) async {
    log('thursday');
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('thu', steps);
    prefs.setInt('thuSteps', steps);
  }

  void setSteps(int currentStepCount) {}
}
//  switch (day.toUpperCase()) {
//       case 'FRI':
//         LocalDatabase().setFri(day, _currentStepCount);
//         break;
//       case 'SAT':
//         LocalDatabase().setSat(day, _currentStepCount);
//         break;
//       case 'SUN':
//         LocalDatabase().setSun(day, _currentStepCount);
//         break;
//       case 'MON':
//         LocalDatabase().setMon(day, _currentStepCount);
//         break;
//       case 'TUE':
//         LocalDatabase().setTue(day, _currentStepCount);
//         break;
//       case 'WED':
//         LocalDatabase().setWed(day, _currentStepCount);
//         break;
//       case 'THU':
//         LocalDatabase().setThu(day, _currentStepCount);
//         break;
//     }